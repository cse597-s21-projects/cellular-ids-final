import sys
import re
from lxml import etree
from logparser import Drain
from datetime import datetime
from mobile_insight.monitor import OfflineReplayer
from mobile_insight.analyzer import MsgLogger, LteRrcAnalyzer, WcdmaRrcAnalyzer, LteNasAnalyzer, UmtsNasAnalyzer, LtePhyAnalyzer, LteMacAnalyzer
import argparse
import os
import pandas as pd
tree = None


def blockPrint():
    sys.stdout = open(os.devnull, 'w')

def enablePrint():
    sys.stdout = sys.__stdout__

def isInt(s):
    try:
        int(s)
        return True
    except:
        return False

def ingestFolder(ingest_dir, output_dir):
    for folder in os.listdir(ingest_dir):
        if(not(os.path.isdir(output_dir+"/"+folder))):
            os.mkdir(output_dir+"/"+folder)
        for log_file in os.listdir(ingest_dir+folder):
            try:
                generate_from_mi2log(os.path.join(ingest_dir,folder,log_file),output_filepath=output_dir+"/"+folder+"/"+log_file+".xml")
            except:
                print("error in generation -- skipping")


def clean_mi2log_xml(filepath):
    with open(filepath, 'r+') as f:
        content = f.read()
        f.seek(0, 0)
        f.write("<root>".rstrip('\r\n') + '\n' + content)
    with open(filepath, 'a') as f:
        f.write("</root>")

def get_unix_time_from_string(timestr):
    return datetime.fromisoformat(timestr).strftime('%s')

def get_filename_from_path(filepath):
    return filepath[filepath.rfind('/')+1:]

def run_drain(input_dir,output_dir,log_file):
    log_format = '<Time>\t<Level>\t:<Content>'  # HDFS log format
    # Regular expression list for optional preprocessing (default: [])
    st         = 0.5  # Similarity threshold
    depth      = 4  # Depth of all leaf nodes

    parser = Drain.LogParser(log_format, indir=input_dir, outdir=output_dir,  depth=depth, st=st)
    parser.parse(log_file)

def print_log(timestamp, level, text,format,file=None):
    if(format):
        _text = text[text.find(":")+1:]
        _text = _text[:_text.rfind('(')]
        _text = _text.strip()
        _text = _text[0].upper() + _text[1:]
        _text = " ".join(re.findall('[A-Z]+[^A-Z]*', _text))
        _text = _text.strip().upper()
        if(text.find(":") != -1):
            if(file is not None):
                file.write(timestamp+"\t"+level+"\t:"+_text)
                file.write("\n")
            else:
                print(timestamp+"\t"+level+"\t:"+_text)
        else:
            if(file is not None):
                file.write(timestamp+"\t"+level+"\t:"+_text)
                file.write("\n")
            else:
                print(timestamp+"\t"+level+"\t:"+_text)
    else:
        if(file is not None):
            file.write(timestamp+"\t"+level+"\t:"+text)
            file.write("\n")
        else:
            print(timestamp+"\t"+level+"\t:"+text)

def test_diag_log_files(input_folder):
    df_dict = {"filename":[],"filesize":[]}
    if(not(os.path.isdir(input_folder+"/tmp"))):
        os.mkdir(input_folder+"/tmp")
    num = len(os.listdir(input_folder))
    done = 0
    for filename in os.listdir(input_folder):
        blockPrint()
        generate_from_mi2log(input_folder+"/"+filename,input_folder+"/tmp/file")
        enablePrint()
        done += 1
        print("done with " + str(done) + " files out of "+str(num))
        df_dict["filename"].append(filename)
        df_dict["filesize"].append(os.path.getsize(input_folder+"/tmp/file"))
        os.remove(input_folder+"/tmp/file")
    df = pd.DataFrame.from_dict(df_dict)
    df.to_csv("output.csv")
        


def generate_from_mi2log(filepath,output_filepath=None):
    src = OfflineReplayer()
    src.set_input_path(filepath)

    filename = get_filename_from_path(filepath)

    logger = MsgLogger()
    logger.set_decode_format(MsgLogger.XML)
    logger.set_dump_type(MsgLogger.FILE_ONLY)
    if(output_filepath is not None):
        op_fp = output_filepath
    else:
        op_fp = "./mi2log_xml/"+filename+"_"+datetime.now().strftime("%H_%M_%S")+'.xml'
    logger.save_decoded_msg_as(op_fp)
    logger.set_source(src)

    # Analyzers
    lte_rrc_analyzer = LteRrcAnalyzer()
    lte_rrc_analyzer.set_source(src)  # bind with the monitor

    # wcdma_rrc_analyzer = WcdmaRrcAnalyzer()
    # wcdma_rrc_analyzer.set_source(src)  # bind with the monitor

    lte_nas_analyzer = LteNasAnalyzer()
    lte_nas_analyzer.set_source(src)

    # umts_nas_analyzer = UmtsNasAnalyzer()
    # umts_nas_analyzer.set_source(src)

    # lte_phy_analyzer = LtePhyAnalyzer()
    # lte_phy_analyzer.set_source(src)

    # lte_mac_analyzer = LteMacAnalyzer()
    # lte_mac_analyzer.set_source(src)

    # Start the monitoring
    src.run()
    clean_mi2log_xml(op_fp)

def generate_logs(ptype, file=None):
    root = tree.getroot()
    if(ptype == 'PDML'):
        for rrc in root.xpath("./packet/proto[@name='lte_rrc' or @name='rrc']"):
            time = rrc.getparent()[0][3].attrib["value"]
            if(rrc.attrib["name"] == "rrc"):
                _elem = rrc.getnext()
                content = _elem.findall("./field/field/field[@name='rrc.payload']")
                if(len(content) == 0):
                    content = _elem.findall("./field/field[@name='rrc.message']")
                    if(len(content) == 0):
                        pass
                        #print(time + "\t" +  "rrc null error")
                    else:
                        #if(content[0].attrib["showname"] == "")
                        print_log(time, "INFO",content[0].attrib["showname"],True,file)
                else:
                    print_log(time, "INFO",content[0].attrib["showname"],True,file)
            elif(rrc.attrib["name"] == "lte_rrc"):
                content = rrc.findall("./field/field/field[@name='lte-rrc.c1']")
                nas_content = rrc.findall(".//proto[@name='nas-eps']")
                sib5content = rrc.findall(".//field[@name='lte-rrc.sib5_element']")
                if(len(content) == 0):
                    pass
                    #print(time + "\t" + "lte_rrc null error")
                else:
                    if(len(sib5content) != 0):
                        log_line = "SIB5: "
                        max_f = 0
                        max_prio = 0
                        freqs = sib5content[0].findall(".//field[@name='lte-rrc.interFreqCarrierFreqList']")[0]
                        for item in freqs:
                            try:
                                freq = item[0][7].attrib['showname'].split(":")[1].strip()
                                prio = item[0][15].attrib['showname'].split(":")[1].strip()
                                if(int(prio) > max_prio):
                                        max_f = int(freq)
                                        max_prio = int(prio)
                            except:
                                continue
                        
                        log_line += "F: " + str(max_f) + ' P: ' + str(max_prio)
                        print_log(time, "INFO",log_line,False,file)
                    elif(content[0].attrib["showname"] == "c1: measurementReport (1)"):
                        log_line = "MEASUREMENT REPORT: "
                        meas = content[0][1][1][1][0][1][3]
                        meas_neighbor = content[0][1][1][1][0][1][1]
                        rsrp = meas[0].attrib["showname"].split("dBm")[0].split(":")[1].strip()
                        rsrq = meas[1].attrib["showname"].split("dB")[0].split(":")[1].strip()
                        if(not isInt(rsrq)):
                            rsrq = rsrq[rsrq.rfind("-"):]
                        log_line += "RSRP:\t" + rsrp + "\tRSRQ:\t" + rsrq
                        if("True" in meas_neighbor.attrib["showname"]):
                            log_line += "\tNEIGH:\t{"
                            meas_neighbor = content[0][1][1][1][0][1][6]
                            log_line += str(len(meas_neighbor[1]))
                            # for cell in meas_neighbor[1]:
                            #     try:
                            #         rsrp = cell[0][2][3].attrib["showname"].split("dBm")[0].split(":")[1].strip()
                            #         rsrq = cell[0][2][4].attrib["showname"].split("dB")[0].split(":")[1].strip()
                            #         if(not isInt(rsrq)):
                            #             rsrq = rsrq[rsrq.rfind("-"):]
                            #         log_line += "RSRP:\t" + rsrp + "\tRSRQ:\t" + rsrq + ";"
                            #     except:
                            #         log_line += "x"
                            log_line += "}"
                        else:
                            log_line += "\tNEIGH:\t{0}"
                        print_log(time, "INFO",log_line,False,file)
                    else:
                        print_log(time, "INFO",content[0].attrib["showname"],True,file)
                if(len(nas_content) != 0):
                    content = nas_content[0].findall("./field[@name='nas_eps.nas_msg_emm_type']")
                    if(len(content) == 0):
                        content = nas_content[0].findall("./field[@name='gsm_a.L3_protocol_discriminator']")
                        if(len(content) == 0):
                            pass
                            #print(time + "\t" +  "nas null error")
                            #print(etree.tostring(nas_content[0]))
                        else:
                            print_log(time, "INFO",content[0].attrib["showname"],True,file)
                    else:
                        print_log(time, "INFO",content[0].attrib["showname"],True,file)
    else:
        for child in root:
            # if(child[1].attrib["key"] == "type_id" and child[1].text == "LTE_PHY_PDSCH_Packet"):
            #     time = get_unix_time_from_string(child[2].text)
            #     serving_cell_id = child[4].text
            #     print_log(time, "INFO","SERVING CELL ID: "+serving_cell_id,False,file)
            for elem in child.xpath("./pair/msg/packet/proto[@name='fake-field-wrapper' or @name='nas-eps']"):
                time = get_unix_time_from_string(elem.getparent().getparent().getparent().getparent()[2].text)
                if(elem.attrib['name'] == 'fake-field-wrapper'):
                    content = elem.findall("./field/field/field[@name='lte-rrc.c1']")
                    sib5content = elem.findall(".//field[@name='lte-rrc.sib5_element']")
                    nas_content = elem.findall(".//proto[@name='nas-eps']")
                    if(len(content) == 0):
                        pass
                        # print(time + "\t" + "lte_rrc null error")
                    else:
                        if(len(sib5content) != 0):
                            log_line = "SIB5: "
                            
                            freqs = sib5content[0].findall(".//field[@name='lte-rrc.interFreqCarrierFreqList']")[0]
                            for item in freqs:
                                #print(elem.getparent().getparent().getparent().getparent()[2].text)
                                #exit(0)
                                max_f = 0
                                max_prio = 0
                                freq = item[0][7].attrib['showname'].split(":")[1].strip()
                                prio = item.findall(".//field[@name='lte-rrc.cellReselectionPriority']")
                                if(len(prio) != 0):
                                    prio = item.findall(".//field[@name='lte-rrc.cellReselectionPriority']")[0].attrib['showname'].split(":")[1].strip()
                                else:
                                    continue
                                if(int(prio) > max_prio):
                                    max_f = int(freq)
                                    max_prio = int(prio)
                                #prio = item[0][16].attrib['showname'].split(":")[1].strip()
                            log_line += "F: " + str(max_f) + ' P: ' + str(max_prio)
                            print_log(time, "INFO",log_line,False,file)
                        elif(content[0].attrib["showname"] == "c1: measurementReport (1)"):
                            try:
                                log_line = "MEASUREMENT REPORT: "
                                meas = content[0][0][1][1][0][1][3]
                                meas_neighbor = content[0][0][1][1][0][1][1]
                                rsrp = meas[0].attrib["showname"].split("dBm")[0].split(":")[1].strip()
                                rsrq = meas[1].attrib["showname"].split("dB")[0].split(":")[1].strip()
                            except:
                                print(etree.tostring(content[0]))
                                exit(0)
                            if(not isInt(rsrq)):
                                rsrq = rsrq[rsrq.rfind("-"):]
                            log_line += "RSRP:\t" + rsrp + "\tRSRQ:\t" + rsrq
                            if("True" in meas_neighbor.attrib["showname"]):
                                log_line += "\tNEIGH:\t{"
                                meas_neighbor = content[0][0][1][1][0][1][6]
                                log_line += str(len(meas_neighbor[1]))
                                # for cell in meas_neighbor[1]:
                                #     try:
                                #         rsrp = cell[0][2][3].attrib["showname"].split("dBm")[0].split(":")[1].strip()
                                #         rsrq = cell[0][2][4].attrib["showname"].split("dB")[0].split(":")[1].strip()
                                #         if(not isInt(rsrq)):
                                #             rsrq = rsrq[rsrq.rfind("-"):]
                                #         log_line += "RSRP:\t" + rsrp + "\tRSRQ:\t" + rsrq + ";"
                                #     except:
                                #         log_line += "x"
                                log_line += "}"
                            else:
                                log_line += "\tNEIGH:\t{0}"
                            print_log(time, "INFO",log_line,False,file)
                        else:
                            print_log(time, "INFO",content[0].attrib["showname"],True,file)
                    if(len(nas_content) != 0):
                        content = nas_content[0].findall("./field[@name='nas_eps.nas_msg_emm_type']")
                        if(len(content) == 0):
                            content = nas_content[0].findall("./field[@name='gsm_a.L3_protocol_discriminator']")
                            if(len(content) == 0):
                                pass
                                # print(time + "\t" +  "nas null error")
                                # print(etree.tostring(nas_content[0]))
                            else:
                                print_log(time, "INFO",content[0].attrib["showname"],True,file)
                        else:
                            #print('printing nas from within rrc')
                            print_log(time, "INFO",content[0].attrib["showname"],True,file)
                else:
                    nas_content = elem.findall(".//proto[@name='nas-eps']")
                    if(len(nas_content) != 0):
                        content = nas_content[0].findall("./field[@name='nas_eps.nas_msg_emm_type']")
                        if(len(content) == 0):
                            pass
                            #print(time + "\t" + "outer nas null error")
                        else:
                            print_log(time, "INFO",content[0].attrib["showname"],True,file)



if __name__ == "__main__":
    args_parser = argparse.ArgumentParser(description="CLI tool to generate xml logs, parse xml logs and generate structured logs using DRAIN")
    args_parser.add_argument('operation', choices=['generate', 'parse','run_drain','test_diag','ingest_folder','batch_parse'],type=str,help='The operation you would like to perform: generate, parse, run_drain')
    args_parser.add_argument('--input_folder',type=str,help='File path',required='test_diag' in sys.argv)
    args_parser.add_argument('--filepath',type=str,help='File path',required='generate' in sys.argv)
    args_parser.add_argument('--parser_type',type=str,help='Type of parser : PDML or MI',required='parse' in sys.argv)
    args_parser.add_argument('--file_to_parse',type=str,help='File path of file to parse',required='parse' in sys.argv)
    args_parser.add_argument('--output_dir',type=str,help='Output directory for structured data',required='run_drain' in sys.argv)
    args_parser.add_argument('--log_file',type=str,help='log file name',required='run_drain' in sys.argv)
    args_parser.add_argument('--ingest_dir',type=str,required='ingest_folder' in sys.argv)
    args_parser.add_argument('--input_csv',type=str,required='batch_parse' in sys.argv)
    args = args_parser.parse_args()
    op = args.operation
    filepath = args.filepath
    if(op == 'generate'):
        generate_from_mi2log(filepath)
    elif(op == 'parse'):
        parser_type = args.parser_type
        file_to_parse = args.file_to_parse
        tree = etree.parse(file_to_parse)
        filename = get_filename_from_path(file_to_parse)
        #file = open("logs/"+filename+'_'+datetime.now().strftime("%H_%M_%S")+'.txt',"w")
        file = None
        generate_logs(parser_type,file)
        #file.close()
    elif(op == 'run_drain'):
        output_dir = args.output_dir
        log_file = args.log_file
        _abs = os.path.abspath(log_file)
        print(_abs)
        input_dir = _abs[:_abs.rfind("/")]
        log_file = _abs[_abs.rfind("/")+1:]
        run_drain(input_dir,output_dir,log_file)
    elif(op == "test_diag"):
        input_folder = args.input_folder
        test_diag_log_files(input_folder)
    elif(op == "ingest_folder"):
        ingest_dir = args.ingest_dir
        ingestFolder(ingest_dir,"ingest_output")
    elif(op == "batch_parse"):
        df = pd.read_csv(args.input_csv)
        #ingest_dir = args.ingest_dir
        for i in range(len(df.index)):
            if(df.iloc[i]["status"] == "GOOD"):
                # print(df.iloc[i]["path"])
                # print("#######################")
                tree = etree.parse(df.iloc[i]["path"])
                generate_logs("MI",None)
    
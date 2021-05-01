import sys
import pandas as pd
import hashlib
import pickle
df_data = None
label_dict = dict()

def str_to_int(text,dig):
    return str((int(hashlib.sha1(text.encode("utf-8")).hexdigest(), 16) % (10 ** dig))+1)

def print_clusters(start):
    flag = False
    flag_p = False
    line = ""
    sign_elem = "6bedeca7"
    elems = list()
    for i in range(df_data.shape[0]):
        if(not flag):
            if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['REQUEST']"):
                if(flag_p):
                    flag_p = False
                    print()
                elems.append(df_data.iloc[i]['EventId'])
                line += str(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)) + " "
                flag  = True
        else:
            if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['RELEASE']"):
                elems.append(df_data.iloc[i]['EventId'])
                if(sign_elem in elems):
                    flag_p = True
                    print(line,end='')
                    print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2),end='')
                line = ""
                elems = list()
                flag = False
            else:
                elems.append(df_data.iloc[i]['EventId'])
                line += str(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)) + " "
                #print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2),end=' ')
    print(line,end='')
    print()

def print_clusters_2(start):
    flag = False
    for i in range(df_data.shape[0]):
        if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['REQUEST']"):
            label_dict[str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)] = df_data.iloc[i]['EventTemplate']+df_data.iloc[i]['ParameterList']
            print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2),end=' ')
            if(flag):
                flag = False
                print()
            else:
                flag = True
        else:
            label_dict[str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)] = df_data.iloc[i]['EventTemplate']+df_data.iloc[i]['ParameterList']
            print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2),end=' ')
    pickle.dump(label_dict,open("dict.dat","wb"))

def print_clusters_debug(start):
    flag = False
    num = 0
    for i in range(df_data.shape[0]):
        if(not flag):
            if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['REQUEST']"):
                print("\nData row :" + str(num),end='\n')
                print()
                print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)+'\t'+df_data.iloc[i]['Content']+"\t"+df_data.iloc[i]['EventId'],end='\n')
                flag  = True
                num+=1
        else:
            if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['RELEASE']"):
                print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)+'\t'+df_data.iloc[i]['Content']+"\t"+df_data.iloc[i]['EventId'],end='\n')
                flag = False
            else:
                print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)+'\t'+df_data.iloc[i]['Content']+"\t"+df_data.iloc[i]['EventId'],end='\n')
    print()
        

if __name__ == "__main__":
    df_data = pd.read_csv(sys.argv[1])
    print_clusters(sys.argv[2])
    #df_templates = pd.read_csv(sys.argv[2])

## this part is for named output for testing

# import sys
# import pandas as pd
# import hashlib
# df_data = None

# def str_to_int(text,dig):
#     return str(int(hashlib.sha1(text.encode("utf-8")).hexdigest(), 16) % (10 ** dig))

# def print_clusters(start):
#     flag = False
#     num = 0
#     for i in range(df_data.shape[0]):
#         if(not flag):
#             if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['REQUEST']"):
#                 print("\nData row :" + str(num),end='\n')
#                 print()
#                 print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)+'\t'+df_data.iloc[i]['Content'],end='\n')
#                 flag  = True
#                 num+=1
#         else:
#             if(df_data.iloc[i]['EventId'] == start and df_data.iloc[i]['ParameterList'] == "['RELEASE']"):
#                 print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)+'\t'+df_data.iloc[i]['Content'],end='\n')
#                 flag = False
#             else:
#                 print(str_to_int(df_data.iloc[i]['EventId']+df_data.iloc[i]['ParameterList'],2)+'\t'+df_data.iloc[i]['Content'],end='\n')
#     print()

        

# if __name__ == "__main__":
#     df_data = pd.read_csv(sys.argv[1])
#     print_clusters(sys.argv[2])
#     #df_templates = pd.read_csv(sys.argv[2])
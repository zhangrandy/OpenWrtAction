#!/bin/bash

source_code_platforms=(openwrt)

immortalwrt_value='{"REPO_URL": "https://github.com/immortalwrt/immortalwrt.git","REPO_BRANCH": "master","CONFIGS": "config/immortalwrt_config","DIY_P1_SH": "diy_script/immortalwrt_diy/diy-part1.sh","DIY_P2_SH": "diy_script/immortalwrt_diy/diy-part2.sh","DIY_P3_SH": "diy_script/immortalwrt_diy/diy-part3.sh","OS": "ubuntu-latest"}'

openwrt_value='{"REPO_URL": "https://github.com/openwrt/openwrt.git","REPO_BRANCH": "main","CONFIGS": "config/openwrt_config","DIY_P1_SH": "diy_script/openwrt_diy/diy-part1.sh","DIY_P2_SH": "diy_script/openwrt_diy/diy-part2.sh","DIY_P3_SH": "diy_script/openwrt_diy/diy-part3.sh","OS": "ubuntu-latest"}'

lede_value='{"REPO_URL": "https://github.com/coolsnowwolf/lede","REPO_BRANCH": "master","CONFIGS": "config/leanlede_config","DIY_P1_SH": "diy_script/lean_diy/diy-part1.sh","DIY_P2_SH": "diy_script/lean_diy/diy-part2.sh","DIY_P3_SH": "diy_script/lean_diy/diy-part3.sh","OS": "ubuntu-latest"}'


immortalwrt_platforms=(R5C)


openwrt_platforms=(R5C)


lede_platforms=(R5C)


copy_backgroundfiles_platforms=(R5C)

matrix_json="["
source_matrix_json="["

for source_platform in "${source_code_platforms[@]}"; do
    

    platforms_var="${source_platform}_platforms[@]"
    platforms=("${!platforms_var}")
    value_var="${source_platform}_value"
    value="${!value_var}"

    source_matrix_json+="{\"source_code_platform\":\"${source_platform}\",\"value\":${value}},"
    
    for platform in "${platforms[@]}"; do
        matrix_json+="{\"source_code_platform\":\"${source_platform}\",\"platform\":\"${platform}\",\"value\":${value}},"
    done
done

matrix_json="${matrix_json%,}]"
source_matrix_json="${source_matrix_json%,}]"


echo $matrix_json
echo $source_matrix_json
echo "matrix=$matrix_json" >> $GITHUB_OUTPUT
echo "source_matrix_json=$source_matrix_json" >> $GITHUB_OUTPUT

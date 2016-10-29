/*
 * inject_binary_selection.h
 *
 *  Created on: 11.09.2016
 *      Author: Alex
 */

#include <sys/utsname.h>

#include "../lib/log.h"

#define MULTIROM_122 "multirom_1.2.2"

int get_mutirom_binary_string(const char *binary_name)
{
    struct utsname sys_version;
    char *ver_string;
    char *ver_substring;
    char *conv_end;
    int minor_num, patch_num = 0;

	INFO("BINARY SELECTOR called.\n");

    if (uname(&sys_version) > -1)
    {
    	INFO("Determining kernel version...\n");
    	ver_string = strdup(sys_version.release);
    	INFO("%s\n", sys_version.release);
    	INFO("%s\n", ver_string);
    	strsep(&ver_string, ".");
//
//    	ver_substring = strtok(0, delimiter);
//    	minor_num = strtol(ver_substring, conv_end, strlen(ver_substring));
//    	if(!*conv_end)
//    	{
//    		ERROR("Kernel minor version extraction failed.");
//    		return -1;
//    	}
//
//    	ver_substring = strtok(0, delimiter);
//    	patch_num = strtol(ver_substring, conv_end, strlen(ver_substring));
//    	if(!*conv_end)
//    	{
//    	    ERROR("Kernel minor version extraction failed.");
//    	    return -1;
//    	}

    	if(minor_num < 10 || (minor_num == 10 && patch_num == 96)) {
    		INFO("Using multirom binary compiled for 1.2.2 AOSP kernels.\n");
    		//strcpy(binary_name, MULTIROM_122);
    		return 0;
    	}
    }
    else
    {
    	INFO("Using standard multirom binary compiled for 1.3.3 AOSP kernels.\n");
    }

	return -1;
}

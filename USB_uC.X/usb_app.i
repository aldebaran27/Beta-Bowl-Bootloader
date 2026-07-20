#line 1 "usb_app.c"
#line 1 "usb_app.c"

#line 7 "usb_app.c"
 


#line 29 "usb_app.c"
 


#line 43 "usb_app.c"
 



#line 1 "./usb_app.h"

#line 7 "./usb_app.h"
 


#line 29 "./usb_app.h"
 


#line 42 "./usb_app.h"
 


#line 46 "./usb_app.h"





 
 
 


#line 61 "./usb_app.h"
 
bool usb_service_class_request(void);


#line 73 "./usb_app.h"
 
bool usb_get_class_descriptor(const uint8_t** descriptor, uint16_t* size);


#line 80 "./usb_app.h"
 
void usb_app_init(void);


#line 90 "./usb_app.h"
 
void usb_app_clear_halt(uint8_t bd_table_index, uint8_t ep, uint8_t dir);


#line 99 "./usb_app.h"
 
void usb_app_tasks(void);


#line 112 "./usb_app.h"
 
bool usb_app_set_interface(uint8_t alternate_setting, uint8_t interface);


#line 125 "./usb_app.h"
 
bool usb_app_get_interface(uint8_t* alternate_setting_result, uint8_t interface);

 

#line 47 "usb_app.c"
#line 48 "usb_app.c"



bool usb_service_class_request(void)
{
    return msd_class_request();
}

bool usb_get_class_descriptor(const uint8_t** descriptor, uint16_t* size)
{
    return false; 
}


void usb_app_init(void)
{
    msd_init();
}


void usb_app_tasks(void)
{
    switch(TRANSACTION_EP)
    {
        case MSD_EP:
            msd_add_task();
            break;
    }
}


void usb_app_clear_halt(uint8_t bd_table_index, uint8_t ep, uint8_t dir)
{
    msd_clear_halt(bd_table_index, ep, dir);
}


bool usb_app_set_interface(uint8_t alternate_setting, uint8_t interface)
{
#line 88 "usb_app.c"
#line 90 "usb_app.c"
    if(alternate_setting != 0 || interface != 0) return false;
    
    msd_clear_ep_toggle();
    return true;
#line 95 "usb_app.c"
}


bool usb_app_get_interface(uint8_t* alternate_setting_result, uint8_t interface)
{
#line 101 "usb_app.c"
#line 103 "usb_app.c"
    return false;
}


bool usb_out_control_finished(void)
{
    return false;
}
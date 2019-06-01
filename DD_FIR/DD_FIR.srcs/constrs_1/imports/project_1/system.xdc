#############################################################
#                                                           #
# HDMI Interface                                            #
#                                                           #
#############################################################
set_property -dict { PACKAGE_PIN W18    IOSTANDARD LVCMOS33 } [get_ports { hdmi_clk }];
set_property -dict { PACKAGE_PIN W17    IOSTANDARD LVCMOS33 } [get_ports { hdmi_vsync }];
set_property -dict { PACKAGE_PIN V17    IOSTANDARD LVCMOS33 } [get_ports { hdmi_hsync }];
set_property -dict { PACKAGE_PIN U16    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data_e }];
set_property -dict { PACKAGE_PIN Y13    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[0] }];
set_property -dict { PACKAGE_PIN AA13   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[1] }];
set_property -dict { PACKAGE_PIN AA14   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[2] }];
set_property -dict { PACKAGE_PIN Y14    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[3] }];
set_property -dict { PACKAGE_PIN AB15   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[4] }];
set_property -dict { PACKAGE_PIN AB16   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[5] }];
set_property -dict { PACKAGE_PIN AA16   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[6] }];
set_property -dict { PACKAGE_PIN AB17   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[7] }];
set_property -dict { PACKAGE_PIN AA17   IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[8] }];
set_property -dict { PACKAGE_PIN Y15    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[9] }];
set_property -dict { PACKAGE_PIN W13    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[10] }];
set_property -dict { PACKAGE_PIN W15    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[11] }];
set_property -dict { PACKAGE_PIN V15    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[12] }];
set_property -dict { PACKAGE_PIN U17    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[13] }];
set_property -dict { PACKAGE_PIN V14    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[14] }];
set_property -dict { PACKAGE_PIN V13    IOSTANDARD LVCMOS33 } [get_ports { hdmi_data[15] }];
set_property -dict { PACKAGE_PIN U15    IOSTANDARD LVCMOS33 } [get_ports { hdmi_spdif }];
set_property -dict { PACKAGE_PIN W16    IOSTANDARD LVCMOS33 } [get_ports { hdmi_int }];
set_property -dict { PACKAGE_PIN AA18   IOSTANDARD LVCMOS33 } [get_ports { hdmi_iic_scl }];
set_property -dict { PACKAGE_PIN Y16    IOSTANDARD LVCMOS33 } [get_ports { hdmi_iic_sda }];

#############################################################
#                                                           #
# VGA Interface                                            #
#                                                           #
#############################################################
set_property -dict { PACKAGE_PIN AA19   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_HSYNC_O_pin }];
set_property -dict { PACKAGE_PIN Y19    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_VSYNC_O_pin }];
set_property -dict { PACKAGE_PIN V20    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_RED_O_pin[0] }];
set_property -dict { PACKAGE_PIN U20    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_RED_O_pin[1] }];

set_property -dict { PACKAGE_PIN V19    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_RED_O_pin[2] }];
set_property -dict { PACKAGE_PIN V18    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_RED_O_pin[3] }];
set_property -dict { PACKAGE_PIN AB22   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_GREEN_O_pin[0] }];
set_property -dict { PACKAGE_PIN AA22   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_GREEN_O_pin[1] }];

set_property -dict { PACKAGE_PIN AB21   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_GREEN_O_pin[2] }];
set_property -dict { PACKAGE_PIN AA21   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_GREEN_O_pin[3] }];
set_property -dict { PACKAGE_PIN Y21    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_BLUE_O_pin[0] }];
set_property -dict { PACKAGE_PIN Y20    IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_BLUE_O_pin[1] }];

set_property -dict { PACKAGE_PIN AB20   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_BLUE_O_pin[2] }];
set_property -dict { PACKAGE_PIN AB19   IOSTANDARD LVCMOS33 } [get_ports { vga_flyinglogo_0_BLUE_O_pin[3] }];

#############################################################
#                                                           #
# GPIO Interface                                            #
#                                                           #
#############################################################

############################
#                          #
# GPIO pin to reset the    #
# USB OTG PHY              #
#                          #
############################
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[0] }];

############################
#                          #
# On-board OLED            #
#                          #
# Voltage control and      #
# Bitbanged SPI over GPIO  #
#                          #
############################
set_property -dict { PACKAGE_PIN U11    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[1] }];
set_property -dict { PACKAGE_PIN U12    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[2] }];
set_property -dict { PACKAGE_PIN U9     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[3] }];
set_property -dict { PACKAGE_PIN U10    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[4] }];
set_property -dict { PACKAGE_PIN AB12   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[5] }];
set_property -dict { PACKAGE_PIN AA12   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[6] }];

############################
#                          #
# On-board LED's           #
#                          #
############################
set_property -dict { PACKAGE_PIN T22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[7] }];
set_property -dict { PACKAGE_PIN T21   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[8] }];
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[9] }];
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[10] }];

set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[11] }];
set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[12] }];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[13] }];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[14] }];

############################
#                          #
# On-board Slide Switches  #
#                          #
############################
set_property -dict { PACKAGE_PIN F22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[15] }];
set_property -dict { PACKAGE_PIN G22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[16] }];
set_property -dict { PACKAGE_PIN H22   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[17] }];
set_property -dict { PACKAGE_PIN F21   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[18] }];

set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[19] }];
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[20] }];
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[21] }];
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[22] }];

############################
#                          #
# On-board Left, Right,    #
# Up, Down, and Select     #
# Pushbuttons              #
#                          #
############################
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[23] }];
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[24] }];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[25] }];
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[26] }];

set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[27] }];

############################
#                          #
# Pmod JA                  #
#                          #
############################
set_property -dict { PACKAGE_PIN Y11    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[28] }];
set_property -dict { PACKAGE_PIN AA11   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[29] }];
set_property -dict { PACKAGE_PIN Y10    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[30] }];
set_property -dict { PACKAGE_PIN AA9    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[31] }];

set_property -dict { PACKAGE_PIN AB11   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[32] }];
set_property -dict { PACKAGE_PIN AB10   IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[33] }];
set_property -dict { PACKAGE_PIN AB9    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[34] }];
set_property -dict { PACKAGE_PIN AA8    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[35] }];

############################
#                          #
# Pmod JB                  #
#                          #
############################
set_property -dict { PACKAGE_PIN W12    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[36] }];
set_property -dict { PACKAGE_PIN W11    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[37] }];
set_property -dict { PACKAGE_PIN V10    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[38] }];
set_property -dict { PACKAGE_PIN W8     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[39] }];

set_property -dict { PACKAGE_PIN V12    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[40] }];
set_property -dict { PACKAGE_PIN W10    IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[41] }];
set_property -dict { PACKAGE_PIN V9     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[42] }];
set_property -dict { PACKAGE_PIN V8     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[43] }];

############################
#                          #
# Pmod JC                  #
#                          #
############################
set_property -dict { PACKAGE_PIN AB7     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[44] }];
set_property -dict { PACKAGE_PIN AB6     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[45] }];
set_property -dict { PACKAGE_PIN Y4      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[46] }];
set_property -dict { PACKAGE_PIN AA4     IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[47] }];

set_property -dict { PACKAGE_PIN R6      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[48] }];
set_property -dict { PACKAGE_PIN T6      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[49] }];
set_property -dict { PACKAGE_PIN T4      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[50] }];
set_property -dict { PACKAGE_PIN U4      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[51] }];

############################
#                          #
# Pmod JD                  #
#                          #
############################
set_property -dict { PACKAGE_PIN V7      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[52] }];
set_property -dict { PACKAGE_PIN W7      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[53] }];
set_property -dict { PACKAGE_PIN V5      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[54] }];
set_property -dict { PACKAGE_PIN V4      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[55] }];

set_property -dict { PACKAGE_PIN W6      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[56] }];
set_property -dict { PACKAGE_PIN W5      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[57] }];
set_property -dict { PACKAGE_PIN U6      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[58] }];
set_property -dict { PACKAGE_PIN U5      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_GPIO[59] }];


#############################################################
#                                                           #
# Pin for detecting USB OTG over-current condition          #
#                                                           #
#############################################################

set_property -dict { PACKAGE_PIN L16      IOSTANDARD LVCMOS33 } [get_ports { otg_oc }];

#test
#set_property -dict { PACKAGE_PIN R4       IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_DDR_WEB_pin }];
#set_property -dict { PACKAGE_PIN N4       IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_PS_CLK_pin }];
#set_property -dict { PACKAGE_PIN J16      IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_PS_PORB_pin }];
    #set_property PACKAGE_PIN J16 [get_ports {get_ports { processing_system7_0_PS_PORB_pin}];  # "FMC-LA15_P"
#set_property -dict { PACKAGE_PIN T1       IOSTANDARD LVCMOS33 } [get_ports { processing_system7_0_PS_SRSTB_pin }];
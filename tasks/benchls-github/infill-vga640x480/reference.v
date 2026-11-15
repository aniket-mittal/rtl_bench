module VGA640x480(
    clk_25m,
    rst_n,
    in_data,
    vga_red,
    vga_green,
    vga_blue,
    vga_hsync,
    vga_vsync,
    frame_addr
);

    input clk_25m;
    input rst_n;
    input [15 : 0] in_data;
    output reg[4:0] vga_red;
    output reg[5:0] vga_green;
    output reg[4:0] vga_blue;
    output reg vga_hsync;
    output reg vga_vsync;
    output [16:0] frame_addr;

    reg[9:0] con_h;
    reg[9:0] con_v;    
    reg[16:0] address;  
    reg blank;

    parameter hRez = 640;
    parameter hStartSync = 640+16;
    parameter hEndSync  = 640+16+96;
    parameter hMaxCount = 800;
    parameter vRez = 480;
    parameter vStartSync = 480+10;
    parameter vEndSync = 480+10+2;
    parameter vMaxCount = 480+10+2+33;
    parameter hsync_active =0;
    parameter vsync_active = 0;

    assign frame_addr = address;
   
    always @(posedge clk_25m or negedge rst_n) begin
        if(~rst_n) begin
            con_h <= 0;
            con_v <= 0;
        end else if(con_h == hMaxCount-1) begin
        	con_h <= 10'b0;
        	if (con_v == vMaxCount-1 ) 
                con_v <= 10'b0;
        	else 
                con_v <= con_v+1;
    	end else 
            con_h <= con_h+1;
    end

    always @(posedge clk_25m or negedge rst_n) begin
        if(~rst_n) begin
            vga_red   <= 0;
            vga_green <= 0;
            vga_blue  <= 0;
    	end else if (blank ==0) begin
    		vga_red   <= in_data[15:11];
    		vga_green <= in_data[10:5];
    		vga_blue  <= in_data[4:0];
		end else begin
    		vga_red   <= 0;
    		vga_green <= 0;
    		vga_blue  <= 0;
        end;
    end

    always @(posedge clk_25m or negedge rst_n) begin
        if(~rst_n) begin
            address <= 17'b0; 
            blank <= 1;
    	end else if (con_v  >= 360 || con_v  < 120) begin
    		address <= 17'b0; 
    		blank <= 1;
        end else begin
            if (con_h  < 480 && con_h  >= 160) begin
            	blank <= 0;
            	address <= address+1;
        	end else blank <= 1;
        end;
    end 

    always @(posedge clk_25m) begin
    	if( con_h > hStartSync && con_h <= hEndSync)
    		vga_hsync <= hsync_active;
    	else 
            vga_hsync <= ~ hsync_active;
    end

    always @(posedge clk_25m) begin
    	if( con_v >= vStartSync && con_v < vEndSync )
    		vga_vsync <= vsync_active;
    	else
    		vga_vsync <= ~ vsync_active;
    end 

endmodule
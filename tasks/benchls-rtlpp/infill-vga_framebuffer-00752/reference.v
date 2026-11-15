module rtlpp_00752(
    CLK25MHz,
    vga_r,
    vga_g,
    vga_b,
    vga_hs,
    vga_vs,
    wclk,
    write_en,
    din,
    cs
);

parameter addr_width = 15;
parameter data_width = 2;
reg [data_width-1:0] mem [(1<<addr_width)-1:0];

reg  [data_width-1:0] dout;
wire [addr_width-1:0] raddr;
reg  [addr_width-1:0] raddr_r = 0;
assign raddr = raddr_r;

input cs; 
input wclk;
input write_en;
reg   write_en_r;
input [data_width-1:0] din;
wire [addr_width-1:0] waddr;
reg  [addr_width-1:0] waddr_r = 0;
assign waddr = waddr_r;

always @(negedge wclk) 
begin
  if(write_en == 0 && write_en_r == 1) begin 
    mem[0] <= din;
    waddr_r <= 1;
    write_en_r <= 0;
  end
  else begin
    mem[waddr] <= din;
    waddr_r <= waddr_r + 1;
    if(write_en == 1) begin
      write_en_r <= 1;
    end
  end
end

input               CLK25MHz;   
output              vga_r;      
output              vga_g;      
output              vga_b;      
output              vga_hs;     
output              vga_vs;     

parameter h_pulse   = 96;   
parameter h_bp      = 48;   
parameter h_pixels  = 640;  
parameter h_fp      = 16;   
parameter h_pol     = 1'b0; 
parameter h_frame   = 800;  
parameter v_pulse   = 2;    
parameter v_bp      = 33;   
parameter v_pixels  = 480;  
parameter v_fp      = 10;   
parameter v_pol     = 1'b1; 
parameter v_frame   = 525;  

reg                 vga_r_r;  
reg                 vga_g_r;
reg                 vga_b_r;
reg                 vga_hs_r; 
reg                 vga_vs_r; 

assign  vga_r       = vga_r_r; 
assign  vga_g       = vga_g_r;
assign  vga_b       = vga_b_r;
assign  vga_hs      = vga_hs_r;
assign  vga_vs      = vga_vs_r;

reg     [7:0]       timer_t = 8'b0; 
reg                 reset = 1;
reg     [9:0]       c_row;      
reg     [9:0]       c_col;      
reg     [9:0]       c_hor;      
reg     [9:0]       c_ver;      
reg     [9:0]       scale_col;  
reg     [9:0]       scale_row;  

reg                 disp_en; 

always @ (posedge CLK25MHz) begin

    if(timer_t > 250) begin 
        reset <= 0;
    end
    else begin
        reset <= 1;              
        timer_t <= timer_t + 1;
        disp_en <= 0;
    end

    if(reset == 1) begin         
        c_hor <= 0;
        c_ver <= 0;
        vga_hs_r <= 1;
        vga_vs_r <= 0;
        c_row <= 0;
        c_col <= 0;
        scale_col <= 82;
        scale_row <= 27;
    end
    else begin 
        if(c_hor < h_frame - 1) begin
            c_hor <= c_hor + 1;
        end
        else begin
            c_hor <= 0;
            if(c_ver < v_frame - 1) begin
                c_ver <= c_ver + 1;
            end
            else begin
                c_ver <= 0;
            end
        end
    end
    if(c_hor < h_pixels + h_fp + 1 || c_hor > h_pixels + h_fp + h_pulse) begin 
        vga_hs_r <= ~h_pol;
    end
    else begin
        vga_hs_r <= h_pol;
    end
    if(c_ver < v_pixels + v_fp || c_ver > v_pixels + v_fp + v_pulse) begin     
        vga_vs_r <= ~v_pol;
    end
    else begin
        vga_vs_r <= v_pol;
    end
    if(c_hor < h_pixels) begin 
        c_col <= c_hor;
    end
    if(c_ver < v_pixels) begin
        c_row <= c_ver;
    end
    if(c_hor < h_pixels && c_ver < v_pixels) begin 
        disp_en <= 1;
    end
    else begin
        disp_en <= 0;
    end
    if(disp_en == 1 && reset == 0) begin

        dout <= mem[raddr]; 

        if(c_row == 0 && c_col == 0) begin 
              scale_col <= 82;
              scale_row <= 27;
        end

        if(c_row == 23 && c_col == 639) begin 
              raddr_r <= 0;
        end

        if(c_col == 0 && c_row > 21 && c_row < 453) begin 
              scale_col <= 82;
              if(c_row == scale_row) begin
                scale_row <= scale_row + 3;
              end
              else if(raddr_r != 0) begin
                
                raddr_r <= raddr_r - 160;
              end
        end

        if(c_col > 80 && c_col < 561 && c_row > 20 && c_row < 453) begin 

            if(c_col == scale_col && c_col < 560) begin
              scale_col <= scale_col + 3;
              
              raddr_r <= raddr_r + 1;
            end

            if(dout == 3) begin 
              vga_r_r <= 0;
              vga_g_r <= 0;
              vga_b_r <= 1; 
            end
            else if(dout == 2) begin
              vga_r_r <= 0;
              vga_g_r <= 1; 
              vga_b_r <= 0;
            end
            else if(dout == 1) begin
              vga_r_r <= 0;
              vga_g_r <= 1; 
              vga_b_r <= 1; 
            end
            else begin
              vga_r_r <= 0; 
              vga_g_r <= 0;
              vga_b_r <= 0;
            end
        end
        else begin 
            vga_r_r <= 0;
            vga_g_r <= 0;
            vga_b_r <= 0;
        end
    end
    else begin 
        vga_r_r <= 0;
        vga_g_r <= 0;
        vga_b_r <= 0;
    end

end

endmodule
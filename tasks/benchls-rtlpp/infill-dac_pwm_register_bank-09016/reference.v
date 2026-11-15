module rtlpp_09016 (
   input                 clk_i           ,  
   input                 rstn_i          ,  
   
   output reg [23:0]     dac_a_o         ,  
   output reg [23:0]     dac_b_o         ,  
   output reg [23:0]     dac_c_o         ,  
   output reg [23:0]     dac_d_o         ,  
   input      [13:0]     pwm0_i          ,  
   input      [13:0]     pwm1_i          , 
   
   input      [31:0]     sys_addr        ,  
   input      [31:0]     sys_wdata       ,  
   input      [ 3:0]     sys_sel         ,  
   input                 sys_wen         ,  
   input                 sys_ren         ,  
   output reg [31:0]     sys_rdata       ,  
   output reg            sys_err         ,  
   output reg            sys_ack         
);

reg [23:0] cfg;
reg [23:0] cfg_b;

wire bit3;
wire bit2;
wire bit1;
wire bit0;
assign {bit3, bit2, bit1, bit0} = pwm0_i[5:2];

wire bit3_b;
wire bit2_b;
wire bit1_b;
wire bit0_b;
assign {bit3_b, bit2_b, bit1_b, bit0_b} = pwm1_i[5:2];

always @(posedge clk_i) begin
    if (rstn_i == 1'b0) begin
        dac_a_o <= 24'h000000 ;
        dac_b_o <= 24'h000000 ;
        dac_c_o <= 24'h000000 ;
        dac_d_o <= 24'h000000 ;

        cfg <= 24'b0;
        cfg_b <= 24'b0;

        sys_err <= 1'b0 ;
        sys_ack <= 1'b0 ;
    end else begin
        dac_a_o <= cfg;
        dac_b_o <= cfg_b;
        if (sys_wen) begin
            if (sys_addr[19:0] == 20'h28) dac_c_o <= sys_wdata[23:0] ;
            if (sys_addr[19:0] == 20'h2C) dac_d_o <= sys_wdata[23:0] ;
        end
        
        cfg <= {~pwm0_i[13], pwm0_i[12:6], 1'b0, bit3, bit2, bit3, bit1, bit3, bit2, bit3, bit0,
                bit3, bit2, bit3, bit1, bit3, bit2, bit3};

        cfg_b <= {~pwm1_i[13], pwm1_i[12:6], 1'b0, bit3_b, bit2_b, bit3_b, bit1_b, bit3_b, bit2_b, bit3_b, bit0_b,
                  bit3_b, bit2_b, bit3_b, bit1_b, bit3_b, bit2_b, bit3_b};

        sys_err <= 1'b0 ;
        case (sys_addr[19:0])
            20'h20: begin 
                sys_ack <= sys_wen | sys_ren;
                sys_rdata <= {8'b0, dac_a_o};
            end
            20'h24: begin 
                sys_ack <= sys_wen | sys_ren;
                sys_rdata <= {8'b0, dac_b_o};
            end
            20'h28: begin 
                sys_ack <= sys_wen | sys_ren;
                sys_rdata <= {8'b0, dac_c_o};
            end
            20'h2C: begin 
                sys_ack <= sys_wen | sys_ren;
                sys_rdata <= {8'b0, dac_d_o};
            end
            default: begin 
                sys_ack <= sys_wen | sys_ren;
                sys_rdata <= 32'h0;
            end
        endcase
    end
end

endmodule
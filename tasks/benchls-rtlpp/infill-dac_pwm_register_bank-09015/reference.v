module rtlpp_09015 (
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
   input      [3:0]      sys_sel         ,  
   input                 sys_wen         ,  
   input                 sys_ren         ,  
   output reg [31:0]     sys_rdata       ,  
   output reg            sys_err         ,  
   output reg            sys_ack            
);

reg [23:0] cfg;
reg [23:0] cfg_b;

always @(posedge clk_i) begin
    if (rstn_i == 1'b0) begin
        dac_a_o <= 24'h000000 ;
        dac_b_o <= 24'h000000 ;
        dac_c_o <= 24'h000000 ;
        dac_d_o <= 24'h000000 ;
        cfg     <= 24'h000000;
        cfg_b   <= 24'h000000;
        sys_err <= 1'b0 ;
        sys_ack <= 1'b0 ;
    end else begin
        dac_a_o <= cfg;
        dac_b_o <= cfg_b;
        if (sys_wen) begin
            if (sys_addr[19:0] == 16'h28) begin
                dac_c_o <= sys_wdata[23:0];
            end 
            if (sys_addr[19:0] == 16'h2C) begin
                dac_d_o <= sys_wdata[23:0];
            end
        end

        sys_err <= 1'b0 ;
        casez (sys_addr[19:0])
            20'h00020 : begin sys_ack <= sys_wen | sys_ren; sys_rdata <= {{8{1'b0}}, dac_a_o}; end
            20'h00024 : begin sys_ack <= sys_wen | sys_ren; sys_rdata <= {{8{1'b0}}, dac_b_o}; end
            20'h00028 : begin sys_ack <= sys_wen | sys_ren; sys_rdata <= {{8{1'b0}}, dac_c_o}; end
            20'h0002C : begin sys_ack <= sys_wen | sys_ren; sys_rdata <= {{8{1'b0}}, dac_d_o}; end
            default   : begin sys_ack <= sys_wen | sys_ren; sys_rdata <= 32'h0; end
        endcase

        cfg  <= {~pwm0_i[13], pwm0_i[12:6], 1'b0, pwm0_i[5:2], pwm0_i[5:2], pwm0_i[5:2], pwm0_i[5:2]};
        cfg_b<= {~pwm1_i[13], pwm1_i[12:6], 1'b0, pwm1_i[5:2], pwm1_i[5:2], pwm1_i[5:2], pwm1_i[5:2]};
    end
end

endmodule
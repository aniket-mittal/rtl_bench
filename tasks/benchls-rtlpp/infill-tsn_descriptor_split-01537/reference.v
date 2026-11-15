module rtlpp_01537
(
       i_clk,
       i_rst_n,
       
       iv_descriptor,
       i_descriptor_wr,

       ov_tsn_descriptor,
       o_tsn_descriptor_wr,

       ov_standard_descriptor,
       o_standard_descriptor_wr
);

input                  i_clk;                   
input                  i_rst_n;

input      [71:0]      iv_descriptor;
input                  i_descriptor_wr;

output reg [45:0]      ov_tsn_descriptor;
output reg             o_tsn_descriptor_wr;

output reg [70:0]      ov_standard_descriptor;
output reg             o_standard_descriptor_wr;

always @(posedge i_clk or negedge i_rst_n) begin
    if(i_rst_n == 1'b0) begin
        ov_tsn_descriptor       <= 46'h0;
        o_tsn_descriptor_wr     <= 1'h0;
		
        ov_standard_descriptor  <= 71'h0;
        o_standard_descriptor_wr<= 1'b0;
    end else begin
        if(i_descriptor_wr == 1'b1) begin
            if(iv_descriptor[23] == 1'b1) begin 
			    ov_tsn_descriptor    <= 46'h0;
                o_tsn_descriptor_wr  <= 1'h0;
				
                ov_standard_descriptor[70:24] <= iv_descriptor[71:25];
                ov_standard_descriptor[23:0] <= iv_descriptor[22:0];
				o_standard_descriptor_wr      <= 1'b1;   
            end else begin
			    ov_tsn_descriptor[45:41] <= 5'b0;
                ov_tsn_descriptor[40]    <= 1'b0;
				ov_tsn_descriptor[39:36] <= iv_descriptor[22:19];
				ov_tsn_descriptor[35:33] <= iv_descriptor[71:69];
				ov_tsn_descriptor[32:19] <= iv_descriptor[68:55];
				ov_tsn_descriptor[18]    <= iv_descriptor[18];
				ov_tsn_descriptor[17:9]  <= iv_descriptor[17:9];
				ov_tsn_descriptor[8:0]   <= iv_descriptor[8:0];
				o_tsn_descriptor_wr      <= 1'b1;
				
                ov_standard_descriptor    <= 71'b0;
				o_standard_descriptor_wr  <= 1'b0;  
            end
        end else begin
			ov_tsn_descriptor       <= 46'h0;
			o_tsn_descriptor_wr     <= 1'h0;
			
			ov_standard_descriptor  <= 71'h0;
			o_standard_descriptor_wr<= 1'b0;
        end
    end
end
endmodule
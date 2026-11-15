module rtlpp_03934 (
    input wire in_valid,
    input wire [31:0] in_pr,
    input wire in_t,
    input wire [15:0] in_raw,
    input wire [31:0] in_opl,
    input wire [31:0] in_oph,
    
    output reg out_taken,
    output reg [31:0] out_target,
    output reg out_delayslot,
    output reg out_write_pr
);

    always @(*) begin   
        out_taken = 1'b0;
        out_target = in_opl + in_oph;
        out_delayslot = 1'b0;
        out_write_pr = 1'b0;

        if (in_valid) begin
            casez (in_raw)
                16'b10001011????????:  
                    begin
                    out_taken = !in_t;
                end
                16'b10001111????????:  
                    begin
                    out_taken = !in_t;
                    out_delayslot = 1'b1;
                end
                16'b10001001????????:  
                    begin
                    out_taken = in_t;
                end
                16'b10001101????????:  
                    begin
                    out_taken = in_t;
                    out_delayslot = 1'b1;
                end
                16'b1010????????????:  
                    begin
                    out_taken = 1'b1;
                    out_delayslot = 1'b1;
                end
                16'b1011????????????:  
                    begin
                    out_taken = 1'b1;
                    out_delayslot = 1'b1;
                    out_write_pr = 1'b1;
                end
                16'b0100????00101011:  
                    begin
                    out_taken = 1'b1;
                    out_delayslot = 1'b1;
                    out_target = in_oph;
                end
                16'b0100????00001011:  
                    begin
                    out_taken = 1'b1;
                    out_delayslot = 1'b1;
                    out_target = in_oph;
                    out_write_pr = 1'b1;
                end
                16'b0000????00100011:  
                    begin
                    out_taken = 1'b1;
                end
                16'b0000????00000011:  
                    begin
                    out_taken = 1'b1;
                    out_delayslot = 1'b1;
                end
                16'b0000000000001011:  
                    begin
                    out_taken = 1'b1;
                    out_target = in_pr;
                    out_delayslot = 1'b1;
                end
                16'b0000000000101011:  
                    begin
                    out_taken = 1'b1;
                    out_target = in_pr;
                end
                default: begin
                    
                end
            endcase
        end
    end

endmodule
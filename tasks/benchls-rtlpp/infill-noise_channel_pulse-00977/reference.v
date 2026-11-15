module rtlpp_00977 (
    input       clk,
    input       ce,
    input       reset_n,
    input [2:0] noise_select,
    input       pulse_in,
    input       noise_4,
    input       noise_5,
    input       noise_large,
    input       sync_reset,
    output      pulse_out
);

    reg         audclk;
    reg         out_next;
    reg         out_reg;

    // Register to store the pulse_out value
    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 1'b0)
            out_reg <= 1'b0;
        else if (ce)
            out_reg <= out_next;
    end

    assign pulse_out = out_reg;

    // Combinational logic to determine the next value of out_reg
    always @(*) begin
        audclk = pulse_in;
        out_next = out_reg;
        
        if (noise_select[2] == 1'b0)
            audclk = pulse_in & noise_5;
        
        if (audclk == 1'b1) begin
            if (noise_select[0] == 1'b1)
                out_next = ~out_reg;
            else if (noise_select[1] == 1'b1)
                out_next = noise_4;
            else
                out_next = noise_large;
        end

        if (sync_reset == 1'b1)
            out_next = 1'b0;
    end

endmodule
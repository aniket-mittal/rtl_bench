module rtlpp_09779 (
    input clk, 
    input rstn, 
    input [23:0] tic_divide, 
    input [23:0] accum_divide, 
    output pre_tic_enable, 
    output tic_enable, 
    output accum_enable, 
    output accum_sample_enable, 
    output [23:0] tic_count, 
    output [23:0] accum_count 
);

    reg [3:0] sc_q; 
    reg [23:0] tic_q;
    reg [23:0] accum_q;
    reg tic_shift;

    always @ (posedge clk or negedge rstn)
    begin
        if (!rstn) 
            sc_q <= 0;
        else if (sc_q == 4) 
            sc_q <= 0;
        else 
            sc_q <= sc_q + 1;
    end
   
    assign accum_sample_enable = (sc_q == 1) ? 1 : 0;

    always @ (posedge clk or negedge rstn)
    begin
        if (!rstn) 
            tic_q <= 0;
        else if (pre_tic_enable == 1'b1) 
            tic_q <= tic_divide;
        else if (tic_q == 0) 
            tic_q <= 24'd16777215;
        else 
            tic_q <= tic_q - 1;
    end
   
    assign pre_tic_enable = (tic_q == 0) ? 1 : 0;
    assign tic_count = tic_q;

    always @ (posedge clk or negedge rstn)
    begin
        if (!rstn)
            tic_shift <= 0;
        else
            tic_shift <= pre_tic_enable;
    end 
   
    assign tic_enable = tic_shift;

    always @ (posedge clk or negedge rstn)
    begin
        if (!rstn) 
            accum_q <= 0;
        else if (accum_enable == 1'b1) 
            accum_q <= accum_divide;
        else if (accum_q == 0) 
            accum_q <= 24'd16777215;
        else 
            accum_q <= accum_q - 1;
    end
    
    assign accum_enable = (accum_q == 0) ? 1 : 0;  
    assign accum_count = accum_q;

endmodule
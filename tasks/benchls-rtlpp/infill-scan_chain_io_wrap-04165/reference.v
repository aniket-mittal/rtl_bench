module dff_rn(input wire rst_n, input wire clk, input wire d, output reg q);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module dff_se(input wire clk, input wire d, input wire se, input wire si, output reg q);
    always @(posedge clk) begin
        if (se)
            q <= si;
        else
            q <= d;
    end
endmodule

module latch_en(input wire d, input wire en, output reg q);
    always @* begin
        if (en)
            q <= d;
    end
endmodule

module user_module_hamming74(input wire [7:0] io_in, output wire [7:0] io_out);
    // User-defined logic for hamming74
    assign io_out = io_in; // Placeholder for the actual logic
endmodule

module rtlpp_04165 (
    input wire clk_in,
    input wire data_in,
    input wire scan_select_in,
    input wire latch_enable_in,
    output wire clk_out,
    output wire data_out,
    output wire scan_select_out,
    output wire latch_enable_out
    );

    wire clk;
    wire data_out_i;

    parameter NUM_IOS = 8;

    wire [NUM_IOS-1:0] scan_data_out;   
    wire [NUM_IOS-1:0] scan_data_in;    
    wire [NUM_IOS-1:0] module_data_in;  
    wire [NUM_IOS-1:0] module_data_out; 

    assign scan_data_in = {scan_data_out[NUM_IOS-2:0], data_in};

    // Internal buffer logic for clk
    buf (clk, clk_in);
    // Buffer logic for output signals
    buf (clk_out, clk);
    buf (data_out, data_out_i);
    buf (scan_select_out, scan_select_in);
    buf (latch_enable_out, latch_enable_in);

    // D flip-flop with asynchronous reset
    dff_rn out_flop (
        .rst_n(1'b1),
        .clk(clk),
        .d(scan_data_out[NUM_IOS-1]),
        .q(data_out_i)
    );

    // Scan flip-flops
    genvar i;
    generate
        for (i = 0; i < NUM_IOS; i = i + 1) begin: scan_flops
            dff_se scan_flop (
                .clk(clk),
                .d(scan_data_in[i]),
                .se(scan_select_in),
                .si(module_data_out[i]),
                .q(scan_data_out[i])
            );
        end
    endgenerate

    // Transparent latch
    generate
        for (i = 0; i < NUM_IOS; i = i + 1) begin: latches
            latch_en latch (
                .d(scan_data_out[i]),
                .en(latch_enable_in),
                .q(module_data_in[i])
            );
        end
    endgenerate

    // Internal user module logic for hamming74
    user_module_hamming74 user_module (
        .io_in(module_data_in),
        .io_out(module_data_out)
    );

endmodule
module origen_138638(
    input wire clk,
    input wire [31:0] data_in,
    output wire [2:0] data_out
);

    wire [31:0] swapped_data;
    wire [2:0] shifted_data;
    
    // Instantiate byte swapper module
    byte_swapper bs (
        .data_in(data_in),
        .data_out(swapped_data)
    );
    
    // Instantiate 3-bit shift register module
    shift_register_3bit sr (
        .clk(clk),
        .data_in(swapped_data[2:0]),
        .data_out(shifted_data)
    );
    
    // Instantiate OR operation module
    or_operation or_op (
        .in1(shifted_data),
        .in2(swapped_data[2:0]),
        .out(data_out)
    );

endmodule

module byte_swapper(
    input wire [31:0] data_in,
    output wire [31:0] data_out
);
    assign data_out = {data_in[7:0], data_in[23:8], data_in[31:24]};
endmodule

module shift_register_3bit(
    input wire clk,
    input wire [2:0] data_in,
    output reg [2:0] data_out
);
    reg [2:0] state;
    
    always @(posedge clk) begin
        state <= {state[1:0], data_in[2]};
        data_out <= {state[2], data_in[1:0]};
    end
endmodule

module or_operation(
    input wire [2:0] in1,
    input wire [2:0] in2,
    output wire [2:0] out
);
    assign out = in1 | in2;
endmodule
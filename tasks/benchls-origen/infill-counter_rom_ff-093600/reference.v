module origen_093600(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire load,
    input wire [11:0] loadbits,
    output reg [11:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 12'b0;
    else if (load)
        count <= loadbits;
    else if (enable)
        count <= count + 1;
end

endmodule

module ROM(
    input wire [11:0] adress,
    output reg [7:0] data
);

reg [7:0] memory [0:4095];

always @(*) begin
    data = memory[adress];
end

endmodule

module flipflopD(
    input wire CLK,
    input wire reset,
    input wire D,
    input wire enable,
    output reg Q
);

always @(posedge CLK or posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else if (enable)
        Q <= D;
end

endmodule

module flipflopD4(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [7:0] prog_byte,
    output reg [3:0] instr,
    output reg [3:0] oprnd
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        instr <= 4'b0;
        oprnd <= 4'b0;
    end else if (enable) begin
        instr <= prog_byte[7:4];
        oprnd <= prog_byte[3:0];
    end
end

endmodule

module ejercicio1(
    input wire clk,
    input wire pc_en,
    input wire fetch_en,
    input wire reset,
    input wire [11:0] loadbits,
    input wire load,
    output wire [7:0] data,
    output wire [3:0] instr,
    output wire [3:0] oprnd
);

wire [11:0] pc_out;

pc_counter pc (
    .clk(clk),
    .reset(reset),
    .enable(pc_en),
    .load(load),
    .loadbits(loadbits),
    .count(pc_out)
);

ROM rom (
    .adress(pc_out),
    .data(data)
);

flipflopD4 ff4 (
    .clk(clk),
    .reset(reset),
    .enable(fetch_en),
    .prog_byte(data),
    .instr(instr),
    .oprnd(oprnd)
);

endmodule
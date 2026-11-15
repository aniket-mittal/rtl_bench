module origen_101100 #(parameter FFID = 0) (
    input wire clk, rst_n, clr, set, en,
    input wire d,
    output reg q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b1;
        else if (clr)
            q <= 1'b0;
        else if (set)
            q <= 1'b1;
        else if (en)
            q <= d;
    end
endmodule

module sipo_register #(parameter WIDTH = 8) (
    input wire clk, rst_n, en, left, sin,
    output reg [WIDTH-1:0] pout
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pout <= {WIDTH{1'b0}};
        else if (en)
            if (left)
                pout <= {pout[WIDTH-2:0], sin};
            else
                pout <= {sin, pout[WIDTH-1:1]};
    end
endmodule

module gen_dff #(parameter FFID = 0) (
    input wire clk, rst_n, clr, set, en,
    input wire d,
    output reg q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;
        else if (clr)
            q <= 1'b0;
        else if (set)
            q <= 1'b1;
        else if (en)
            q <= d;
    end
endmodule

module piso_register #(
    parameter WIDTH = 8,
    parameter [WIDTH-1:0] DEFAULT = {WIDTH{1'b0}}
) (
    input wire clk, rst_n, load, clr, shift,
    input wire [WIDTH-1:0] pin,
    output wire sout
);
    reg [WIDTH-1:0] data;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data <= DEFAULT;
        else if (clr)
            data <= DEFAULT;
        else if (load)
            data <= pin;
        else if (shift)
            data <= {data[WIDTH-2:0], 1'b0};
    end

    assign sout = data[WIDTH-1];
endmodule

module counter #(parameter WIDTH = 8) (
    input wire clk, rst_n, clr, en,
    output reg [WIDTH-1:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= {WIDTH{1'b0}};
        else if (clr)
            count <= {WIDTH{1'b0}};
        else if (en)
            count <= count + 1'b1;
    end
endmodule

module register #(parameter WIDTH = 8) (
    input wire clk, rst_n, load, clr,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= {WIDTH{1'b0}};
        else if (clr)
            q <= {WIDTH{1'b0}};
        else if (load)
            q <= d;
    end
endmodule

module mux2to1 #(parameter WIDTH = 1) (
    input wire sel,
    input wire [WIDTH-1:0] in0, in1,
    output wire [WIDTH-1:0] out
);
    assign out = sel ? in1 : in0;
endmodule

module bsMux (
    input wire [1:0] sel,
    input wire in0, in1, in2,
    output reg out
);
    localparam BS_ZERO = 2'b00;
    localparam BS_ONE = 2'b01;
    localparam BS_DATA = 2'b10;

    always @(*) begin
        case (sel)
            BS_ZERO: out = 1'b0;
            BS_ONE: out = 1'b1;
            BS_DATA: out = in2;
            default: out = in0;
        endcase
    end
endmodule

module fifo #(parameter DEPTH = 32) (
    input wire clk, rst_n,
    input wire write, read,
    input wire din,
    output wire dout,
    output wire full, empty,
    output wire [$clog2(DEPTH):0] item_count
);
    reg [DEPTH-1:0] buffer;
    reg [$clog2(DEPTH)-1:0] put_ptr, get_ptr;
    reg [$clog2(DEPTH):0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            buffer <= {DEPTH{1'b0}};
            put_ptr <= {$clog2(DEPTH){1'b0}};
            get_ptr <= {$clog2(DEPTH){1'b0}};
            count <= {($clog2(DEPTH)+1){1'b0}};
        end else begin
            if (write && !full) begin
                buffer[put_ptr] <= din;
                put_ptr <= put_ptr + 1;
                count <= count + 1;
            end
            if (read && !empty) begin
                get_ptr <= get_ptr + 1;
                count <= count - 1;
            end
        end
    end

    assign dout = buffer[get_ptr];
    assign full = (count == DEPTH);
    assign empty = (count == 0);
    assign item_count = count;
endmodule
module rtlpp_07961 (
    DATA_OUT, FULL, EMPTY,
    CLK, RESETn, DATA_IN, PUSH, POP
);

    parameter DATA_WIDTH = 8;
    parameter ADDR_EXP   = 12;
    parameter ADDR_DEPTH = 4096;

    input CLK;
    input RESETn;

    input [DATA_WIDTH - 1:0] DATA_IN;
    input PUSH;
    input POP;

    output [DATA_WIDTH - 1:0] DATA_OUT;
    output FULL;
    output EMPTY;

    reg EMPTY;
    reg FULL;

    reg [DATA_WIDTH -1:0] memory[0:ADDR_DEPTH-1];
    reg [ADDR_EXP -1:0] write_ptr;
    reg [ADDR_EXP -1:0] read_ptr;

    reg [DATA_WIDTH-1:0] DATA_OUT;
    reg [ADDR_EXP -1:0] next_write_ptr;
    reg [ADDR_EXP -1:0] next_read_ptr;
    wire accept_write;
    wire accept_read;

    always @(posedge CLK) begin
        if (!RESETn) begin
            next_write_ptr <= 'b0;
            next_read_ptr <= 'b0;
        end else begin
            next_write_ptr <= write_ptr + 1;
            next_read_ptr <= read_ptr + 1;
        end
    end

    assign accept_write = (PUSH && !FULL) || (PUSH && POP);
    assign accept_read = (POP && !EMPTY) || (PUSH && POP);

    always @(posedge CLK) begin
        if (!RESETn) begin
            write_ptr <= 'b0;
        end else begin
            if (accept_write) begin
                write_ptr <= next_write_ptr;
            end
        end
    end

    always @(posedge CLK) begin
        if (!RESETn) begin
            read_ptr <= 'b0;
        end else begin
            if (accept_read) begin
                read_ptr <= next_read_ptr;
            end
        end
    end

    always @(posedge CLK) begin
        if (!RESETn) begin
            EMPTY <= 1'b1;
        end else begin
            if (EMPTY && accept_write) begin
                EMPTY <= 1'b0;
            end
            if (accept_read && (next_read_ptr == write_ptr)) begin
                EMPTY <= 1'b1;
            end
        end
    end

    always @(posedge CLK) begin
        if (!RESETn) begin
            FULL <= 1'b0;
        end else begin
            if (accept_write && (next_write_ptr == read_ptr)) begin
                FULL <= 1;
            end else if (FULL && accept_read) begin
                FULL <= 0;
            end
        end
    end

    always @(posedge CLK) begin
        if (accept_write) begin
            memory[write_ptr] <= DATA_IN;
        end
        DATA_OUT <= memory[read_ptr];
    end

endmodule
module origen_044970 (
    input clk,
    input d,
    output reg q
);
    always @(posedge clk)
        q <= d;
endmodule

module synchronizer #(
    parameter WIDTH = 1
) (
    input clk,
    input [WIDTH-1:0] d,
    output [WIDTH-1:0] q
);
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : sync
            wire q1;
            dff dff1 (.clk(clk), .d(d[i]), .q(q1));
            dff dff2 (.clk(clk), .d(q1), .q(q[i]));
        end
    endgenerate
endmodule

module clocked_bus_slave #(
    parameter ADR_WIDTH = 16,
    parameter DATA_WIDTH = 32
) (
    input clk,
    input aNE,
    input aNOE,
    input aNWE,
    input [ADR_WIDTH-1:0] aAn,
    inout [DATA_WIDTH-1:0] aDn,
    output reg [ADR_WIDTH-1:0] r_adr,
    output reg [ADR_WIDTH-1:0] w_adr,
    output reg do_read,
    output reg do_write,
    input [DATA_WIDTH-1:0] read_data,
    output reg io_output
);

    localparam IDLE = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ1 = 2'b10;
    localparam READ2 = 2'b11;

    reg [1:0] state, next_state;
    wire s_aNE, s_aNOE, s_aNWE;
    reg [DATA_WIDTH-1:0] rDn;

    synchronizer #(1) sync_NE (.clk(clk), .d(aNE), .q(s_aNE));
    synchronizer #(1) sync_NOE (.clk(clk), .d(aNOE), .q(s_aNOE));
    synchronizer #(1) sync_NWE (.clk(clk), .d(aNWE), .q(s_aNWE));

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (!s_aNE && !s_aNWE)
                    next_state = WRITE;
                else if (!s_aNE && !s_aNOE)
                    next_state = READ1;
            end
            WRITE: begin
                if (s_aNWE || s_aNE)
                    next_state = IDLE;
            end
            READ1: next_state = READ2;
            READ2: begin
                if (s_aNOE || s_aNE)
                    next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk) begin
        do_read <= 1'b0;
        do_write <= 1'b0;
        io_output <= 1'b0;

        case (state)
            IDLE: begin
                if (next_state == WRITE) begin
                    w_adr <= aAn;
                    do_write <= 1'b1;
                end else if (next_state == READ1) begin
                    r_adr <= aAn;
                    do_read <= 1'b1;
                end
            end
            READ1: rDn <= read_data;
            READ2: io_output <= 1'b1;
        endcase
    end

    assign aDn = (state == READ2) ? rDn : {DATA_WIDTH{1'bz}};

endmodule
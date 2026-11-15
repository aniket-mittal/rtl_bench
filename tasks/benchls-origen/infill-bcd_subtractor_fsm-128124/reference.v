module origen_128124 (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

// Internal signals
wire [3:0] a, b, a_comp, b_comp;
wire [3:0] diff;
wire borrow;
reg [3:0] state, next_state;
reg [3:0] result;

// Assign input data to internal signals
assign a = data_in[7:4];
assign b = data_in[3:0];
assign a_comp = ~a + 1;
assign b_comp = ~b + 1;

// Instantiate the subtractor module
subtractor_4bit sub (
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
);

// Instantiate the D flip-flop module
d_flip_flop_4bit dff (
    .clk(clk),
    .rst(rst),
    .d(result),
    .q(data_out[3:0])
);

// FSM states
localparam IDLE = 4'b0000;
localparam SUBTRACT = 4'b0001;
localparam COMPLEMENT = 4'b0010;
localparam OUTPUT = 4'b0011;

// FSM state register
always @(posedge clk or posedge rst) begin
    if (rst)
        state <= IDLE;
    else
        state <= next_state;
end

// FSM next state logic
always @(*) begin
    case (state)
        IDLE: next_state = SUBTRACT;
        SUBTRACT: next_state = (diff[3]) ? COMPLEMENT : OUTPUT;
        COMPLEMENT: next_state = OUTPUT;
        OUTPUT: next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

// FSM output logic
always @(*) begin
    case (state)
        SUBTRACT: result = diff;
        COMPLEMENT: result = ~diff + 1;
        OUTPUT: result = result;
        default: result = 4'b0000;
    endcase
end

// Assign upper 4 bits of output
assign data_out[7:4] = 4'b0000;

endmodule

module subtractor_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [3:0] diff,
    output wire borrow
);

assign {borrow, diff} = a - b;

endmodule

module d_flip_flop_4bit (
    input wire clk,
    input wire rst,
    input wire [3:0] d,
    output reg [3:0] q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 4'b0000;
    else
        q <= d;
end

endmodule
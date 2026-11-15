module origen_071284(
    input clk_50m,
    input rst,
    input echo,
    output reg Led,
    output reg [15:0] Distance,
    output reg trig
);

// State parameters
parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;

// State registers
reg [1:0] curr_state, next_state;

// Edge detection registers
reg echo_reg1, echo_reg2;

// Derived signals
wire start, finish;
assign start = echo_reg1 & ~echo_reg2;
assign finish = ~echo_reg1 & echo_reg2;

// Counter and distance registers
reg [15:0] count;
reg [15:0] dis_reg;

// Clock division
reg clk_1Hz;
reg [25:0] cnt;

// Clock division logic
always @(posedge clk_50m or posedge rst) begin
    if (rst) begin
        cnt <= 0;
        clk_1Hz <= 0;
    end else begin
        if (cnt == 25000000) begin
            cnt <= 0;
            clk_1Hz <= ~clk_1Hz;
        end else begin
            cnt <= cnt + 1;
        end
    end
end

// Edge detection logic
always @(posedge clk_50m or posedge rst) begin
    if (rst) begin
        echo_reg1 <= 0;
        echo_reg2 <= 0;
    end else begin
        echo_reg1 <= echo;
        echo_reg2 <= echo_reg1;
    end
end

// FSM state transition
always @(posedge clk_50m or posedge rst) begin
    if (rst)
        curr_state <= s0;
    else
        curr_state <= next_state;
end

// FSM combinational logic
always @(*) begin
    case (curr_state)
        s0: next_state = start ? s1 : s0;
        s1: next_state = finish ? s2 : s1;
        s2: next_state = s0;
        default: next_state = s0;
    endcase
end

// FSM output logic
always @(posedge clk_50m or posedge rst) begin
    if (rst) begin
        count <= 0;
        dis_reg <= 0;
        Distance <= 0;
        Led <= 0;
    end else begin
        case (curr_state)
            s0: count <= 0;
            s1: count <= count + 1;
            s2: begin
                dis_reg <= (count * 17) / 1000;
                Distance <= dis_reg;
                Led <= (dis_reg < 10) ? 1'b1 : 1'b0;
            end
        endcase
    end
end

endmodule
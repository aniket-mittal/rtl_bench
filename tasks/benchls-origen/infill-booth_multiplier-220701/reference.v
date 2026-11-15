module origen_220701(
    input clk,
    input rst,
    input load,
    input [5:0] a,
    input [5:0] b,
    output reg slow_clk,
    output reg [11:0] product
);

reg [5:0] la, lb;
reg [2:0] counter;
reg [11:0] temp;
reg [32:0] mcounter;
reg [6:0] Q;
reg [5:0] A;

always @(posedge clk) begin
    if (rst) begin
        product <= 12'b0;
        counter <= 3'b0;
    end else if (load) begin
        product <= 12'b0;
        counter <= 3'b0;
        la <= a;
        lb <= b;
        Q <= {1'b0, a};
        A <= 6'b0;
    end else if (counter <= 5) begin
        case (Q[1:0])
            2'b00, 2'b11: begin
                A <= A;
                Q <= {A[0], Q[6:1]};
            end
            2'b01: begin
                A <= A + lb;
                Q <= {A[0], Q[6:1]};
            end
            2'b10: begin
                A <= A - lb;
                Q <= {A[0], Q[6:1]};
            end
        endcase
        product <= {A, Q[5:0]};
        counter <= counter + 1;
    end
end

always @(posedge clk) begin
    mcounter <= mcounter + 1;
    slow_clk <= mcounter[0];
end

endmodule
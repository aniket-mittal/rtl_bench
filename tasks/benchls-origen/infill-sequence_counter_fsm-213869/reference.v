module origen_213869(
    input clk,
    input rst,
    input start,
    input [9:0] data,
    output reg en,
    output reg flag,
    output reg fin,
    output reg [9:0] addr,
    output reg [9:0] result
);

reg [2:0] state;
reg [9:0] num;
reg [9:0] ans;

localparam IDLE = 3'b000;
localparam S0 = 3'b001;
localparam S1 = 3'b010;
localparam S2 = 3'b011;
localparam S3 = 3'b100;
localparam S4 = 3'b101;
localparam S5 = 3'b110;
localparam S6 = 3'b111;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        num <= 0;
        ans <= 0;
        en <= 1;
        flag <= 0;
        fin <= 0;
        addr <= 0;
        result <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                if (start) begin
                    state <= S0;
                    num <= 1023;
                end
            end
            S0: begin
                state <= S1;
                num <= num + 1;
            end
            S1: begin
                state <= S2;
                num <= num + 1;
            end
            S2: begin
                state <= S3;
                num <= num + 1;
            end
            S3: begin
                state <= S4;
                num <= num + 1;
            end
            S4: begin
                state <= S5;
                num <= num + 1;
            end
            S5: begin
                state <= S6;
                num <= num + 1;
            end
            S6: begin
                if (data[0]) begin
                    ans <= ans + 1;
                    flag <= 1;
                end
                else begin
                    flag <= 0;
                end
                if (num == 1023) begin
                    state <= IDLE;
                    fin <= 1;
                    result <= ans;
                end
                else begin
                    state <= S0;
                    num <= num + 1;
                    fin <= 0;
                end
            end
        endcase
        addr <= num;
    end
end

endmodule
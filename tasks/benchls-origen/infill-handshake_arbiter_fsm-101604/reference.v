module origen_101604(
    input [1:0] ack,
    input [1:0] ack2,
    input clk,
    input rst,
    output reg [15:0] dado,
    output reg [1:0] send,
    output reg [1:0] send2
);

    reg [1:0] S, NS;

    // Next state logic
    always @(*) begin
        case ({|ack, |ack2})
            2'b00: NS = 2'b00;
            2'b01: NS = 2'b10;
            2'b10: NS = 2'b01;
            2'b11: NS = 2'b11;
        endcase
    end

    // State update
    always @(posedge clk or posedge rst) begin
        if (rst)
            S <= 2'b00;
        else
            S <= NS;
    end

    // Output logic
    always @(posedge clk) begin
        case (S)
            2'b00: begin
                send <= 2'b01;
                send2 <= 2'b01;
            end
            2'b01: begin
                send <= 2'b00;
                send2 <= 2'b01;
            end
            2'b10: begin
                send <= 2'b01;
                send2 <= 2'b00;
            end
            2'b11: begin
                send <= 2'b00;
                send2 <= 2'b00;
            end
        endcase

        // Increment dado
        dado <= dado + 1;
    end

endmodule
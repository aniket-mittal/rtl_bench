module origen_166057(
    input clk,
    input reset,
    output reg fetch,
    output reg alu_ena
);

    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;
    parameter S6 = 3'b110;
    parameter S7 = 3'b111;
    parameter S8 = 4'b1000;
    parameter idle = 3'b000;

    reg [2:0] state;

    always @(negedge clk) begin
        if (reset) begin
            state <= idle;
            fetch <= 1'b0;
            alu_ena <= 1'b0;
        end else begin
            case (state)
                S1: begin
                    alu_ena <= 1'b1;
                    state <= S2;
                end
                S2: begin
                    alu_ena <= 1'b0;
                    state <= S3;
                end
                S3: begin
                    fetch <= 1'b1;
                    state <= S4;
                end
                S4: state <= S5;
                S5: state <= S6;
                S6: state <= S7;
                S7: begin
                    fetch <= 1'b0;
                    state <= S8;
                end
                S8: state <= S1;
                idle: state <= S1;
                default: state <= S1;
            endcase
        end
    end

endmodule
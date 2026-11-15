module origen_006185 (
    input wire clk,
    input wire rst_n,
    input wire [2:0] opcode,
    input wire [7:0] dina,
    input wire [7:0] dinb,
    output reg cout,
    output reg [7:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cout <= 1'b0;
            dout <= 8'b0;
        end else begin
            case (opcode)
                3'b000: {cout, dout} <= dina + dinb;
                3'b001: begin
                    cout <= 1'b0;
                    dout <= (dina > dinb) ? (dina - dinb) : (dinb - dina);
                end
                3'b010: begin
                    cout <= 1'b0;
                    dout <= dina & dinb;
                end
                3'b011: begin
                    cout <= 1'b0;
                    dout <= dina | dinb;
                end
                3'b100: begin
                    cout <= 1'b0;
                    dout <= dina ^ dinb;
                end
                3'b101: begin
                    cout <= 1'b0;
                    dout <= dina << dinb[2:0];
                end
                3'b110: begin
                    cout <= 1'b0;
                    dout <= dina >> dinb[2:0];
                end
                default: begin
                    cout <= 1'b0;
                    dout <= 8'b0;
                end
            endcase
        end
    end

endmodule
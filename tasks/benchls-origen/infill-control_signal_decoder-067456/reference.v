module origen_067456(
    input wire clk,
    input wire [4:0] operacao,
    output reg [4:0] Tx,
    output reg [4:0] Ty,
    output reg [4:0] Tz,
    output reg [4:0] Tula
);

always @(posedge clk) begin
    case(operacao)
        5'd0: begin
            Tx <= 5'd1;
            Ty <= 5'd2;
            Tz <= 5'd2;
            Tula <= 5'd0;
        end
        5'd1: begin
            Tx <= 5'd1;
            Ty <= 5'd1;
            Tz <= 5'd0;
            Tula <= 5'd1;
        end
        5'd2: begin
            Tx <= 5'd2;
            Ty <= 5'd1;
            Tz <= 5'd0;
            Tula <= 5'd1;
        end
        5'd3: begin
            Tx <= 5'd2;
            Ty <= 5'd3;
            Tz <= 5'd0;
            Tula <= 5'd0;
        end
        5'd4: begin
            Tx <= 5'd2;
            Ty <= 5'd0;
            Tz <= 5'd1;
            Tula <= 5'd0;
        end
        default: begin
            Tx <= 5'd0;
            Ty <= 5'd0;
            Tz <= 5'd0;
            Tula <= 5'd0;
        end
    endcase
end

endmodule
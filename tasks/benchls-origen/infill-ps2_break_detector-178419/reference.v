module origen_178419(
    input ready,
    input clk,
    input reset,
    input [7:0] datain,
    output reg [7:0] dataout
);

reg [1:0] estado, est_sig;

always @(posedge clk or posedge reset) begin
    if (reset)
        estado <= 2'b00;
    else
        estado <= est_sig;
end

always @* begin
    case (estado)
        2'b00: begin
            if (ready)
                est_sig = 2'b01;
            else
                est_sig = 2'b00;
        end
        2'b01: begin
            if (datain == 8'hf0)
                est_sig = 2'b10;
            else
                est_sig = 2'b00;
        end
        2'b10: begin
            if (ready)
                est_sig = 2'b00;
            else
                est_sig = 2'b10;
        end
        2'b11: begin
            est_sig = 2'b00;
        end
        default: begin
            est_sig = 2'b00;
        end
    endcase
end

always @(posedge clk or posedge reset) begin
    if (reset)
        dataout <= 8'd0;
    else if (estado == 2'b10 && ready)
        dataout <= datain;
end

endmodule
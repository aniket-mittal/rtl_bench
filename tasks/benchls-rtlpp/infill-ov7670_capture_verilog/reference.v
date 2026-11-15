module ov7670_capture_verilog (
        input pclk,
        input vsync,
        input href,
        input [7:0] d,
        output reg [18:0] addr,
        output reg [11:0] dout,
        output reg we
    );
        always @(posedge pclk) begin
            if (vsync == 1) begin
                addr <= 0;
                we <= 0;
            end else if (href == 1) begin
                dout <= {d[7:4], d[3:0], d[7:4]};
                we <= 1;
                addr <= addr + 1;
            end else begin
                we <= 0;
            end
        end
    endmodule
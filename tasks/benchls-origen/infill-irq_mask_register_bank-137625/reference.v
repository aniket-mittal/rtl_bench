module origen_137625 (
    input wire [1:0] address,
    input wire chipselect,
    input wire clk,
    input wire in_port,
    input wire reset_n,
    input wire write_n,
    input wire [31:0] writedata,
    output reg irq,
    output reg [31:0] readdata
);

    reg [31:0] data [3:0];
    reg [3:0] irq_mask;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data[0] <= 32'h0;
            data[1] <= 32'h0;
            data[2] <= 32'h0;
            data[3] <= 32'h0;
            irq_mask <= 4'h0;
            irq <= 1'b0;
            readdata <= 32'h0;
        end else if (chipselect) begin
            if (!write_n) begin
                case (address)
                    2'b00: data[0] <= writedata;
                    2'b01: data[1] <= writedata;
                    2'b10: data[2] <= writedata;
                    2'b11: irq_mask <= writedata[3:0];
                endcase
            end else begin
                case (address)
                    2'b00: readdata <= data[0];
                    2'b01: readdata <= data[1];
                    2'b10: readdata <= data[2];
                    2'b11: readdata <= {28'h0, irq_mask};
                endcase
            end
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            irq <= 1'b0;
        end else if (chipselect) begin
            irq <= (irq_mask[address] & in_port);
        end
    end

endmodule
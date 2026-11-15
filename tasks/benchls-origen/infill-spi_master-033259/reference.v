module origen_033259(
    input wire clk,
    input wire rst,
    input wire [7:0] txdin,
    input wire txgo,
    input wire MISO,
    output reg MOSI,
    output wire SCLK,
    output reg txrdy,
    output reg [7:0] rxdout
);

    reg [7:0] count;
    reg [7:0] datareg;
    reg [3:0] bitcount;

    assign SCLK = count[3];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 8'd0;
            datareg <= 8'd0;
            bitcount <= 4'd0;
            MOSI <= 1'b0;
            txrdy <= 1'b1;
            rxdout <= 8'd0;
        end else begin
            if (txgo && txrdy) begin
                count <= 8'd134;
                datareg <= txdin;
                bitcount <= 4'd8;
                txrdy <= 1'b0;
            end else if (count > 0) begin
                count <= count - 1'b1;
                
                if (count[3:0] == 4'd8) begin
                    rxdout <= {rxdout[6:0], MISO};
                end
                
                if (count[3:0] == 4'd0) begin
                    MOSI <= datareg[7];
                    datareg <= {datareg[6:0], 1'b0};
                    if (bitcount > 0) begin
                        bitcount <= bitcount - 1'b1;
                    end
                end
            end
            
            if (bitcount == 4'd0) begin
                txrdy <= 1'b1;
            end
        end
    end

endmodule
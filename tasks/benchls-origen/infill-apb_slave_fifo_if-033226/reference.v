module origen_033226 (
    input wire pclk,
    input wire presetn,
    input wire [31:0] paddr,
    input wire psel,
    input wire penable,
    input wire pwrite,
    input wire [31:0] pwdata,
    output reg pready,
    output reg [31:0] prdata,
    input wire [31:0] din,
    input wire din_rdy,
    output reg [31:0] dout,
    output reg dout_rdy,
    output reg din_req
);

    always @(posedge pclk) begin
        if (psel) begin
            if (pwrite) begin
                // Write operation
                dout <= pwdata;
                dout_rdy <= 1'b1;
                pready <= 1'b1;
                prdata <= 32'b0;
                din_req <= 1'b0;
            end else begin
                // Read operation
                din_req <= 1'b1;
                if (din_rdy) begin
                    prdata <= din;
                    pready <= 1'b1;
                end else begin
                    prdata <= 32'b0;
                    pready <= 1'b0;
                end
                dout <= 32'b0;
                dout_rdy <= 1'b0;
            end
        end else begin
            // Not selected, reset all outputs
            din_req <= 1'b0;
            prdata <= 32'b0;
            pready <= 1'b0;
            dout_rdy <= 1'b0;
            dout <= 32'b0;
        end
    end

endmodule
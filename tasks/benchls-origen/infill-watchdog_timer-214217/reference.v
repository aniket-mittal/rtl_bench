module origen_214217 #(
    parameter MHZ = 20,
    parameter HZ = 100,
    parameter MAX = (MHZ * 1000000) / HZ
)(
    input wire clk,
    input wire busrst,
    input wire kwreq,
    input wire kwwr,
    input wire [15:0] kwwdata,
    output reg [15:0] kwrdata,
    output reg kwack,
    output reg kwirq
);

    reg [15:0] ctr;
    reg mon, mon0, ie;

    always @(posedge clk) begin
        if (busrst) begin
            ctr <= 16'b0;
            mon <= 1'b0;
            mon0 <= 1'b0;
            ie <= 1'b0;
            kwirq <= 1'b0;
        end else begin
            ctr <= ctr + 16'b1;
            if (ctr == MAX - 16'b1) begin
                ctr <= 16'b0;
                mon <= 1'b1;
            end else begin
                mon <= 1'b0;
            end

            mon0 <= mon;
            kwack <= kwreq;

            if (kwreq && kwwr) begin
                mon <= kwwdata[15];
                ie <= kwwdata[0];
            end

            if (mon && ~mon0 && ie) begin
                kwirq <= 1'b1;
            end else begin
                kwirq <= 1'b0;
            end
        end
    end

    always @(*) begin
        kwrdata = {15'b0, mon};
    end

endmodule
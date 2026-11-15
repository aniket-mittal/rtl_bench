module origen_103972 (
    input wire clk,
    input wire rst_n,
    input wire en,
    output reg rdy,
    output reg [7:0] addr,
    output reg [7:0] wrdata,
    output reg wren
);

    reg [8:0] count;
    reg go;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rdy <= 1'b1;
            addr <= 8'bx;
            wrdata <= 8'bx;
            wren <= 1'b0;
            count <= 9'd0;
            go <= 1'b0;
        end else begin
            if (count == 9'd0 && !go) begin
                if (en) begin
                    rdy <= 1'b0;
                    go <= 1'b1;
                end else begin
                    rdy <= 1'b1;
                end
            end

            if (go) begin
                if (count < 9'd256) begin
                    addr <= count[7:0];
                    wrdata <= count[7:0];
                    wren <= 1'b1;
                    count <= count + 1'b1;
                end else if (count == 9'd256) begin
                    wren <= 1'b0;
                    count <= count + 1'b1;
                end else begin // count == 9'd257
                    rdy <= 1'b1;
                    go <= 1'b0;
                    addr <= 8'bx;
                    wrdata <= 8'bx;
                    count <= 9'd0;
                end
            end
        end
    end

endmodule
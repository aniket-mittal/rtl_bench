module origen_035976(
    input BTN,
    input CLK,
    output [7:0] DISP1
);

    parameter N = 50_000_000;

    reg [31:0] cnt;
    reg [3:0] count;
    reg [7:0] DISP2;

    always @(posedge CLK or posedge BTN) begin
        if (BTN) begin
            cnt <= 0;
            count <= 0;
        end else begin
            if (cnt == N - 1) begin
                cnt <= 0;
                if (count == 15)
                    count <= 0;
                else
                    count <= count + 1;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

    [MASKED]

    assign DISP1 = DISP2;

endmodule
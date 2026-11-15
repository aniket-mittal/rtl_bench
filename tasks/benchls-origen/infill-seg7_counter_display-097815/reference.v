module origen_097815(
    input clk,
    input [15:0] SW,
    output CA, CB, CC, CD, CE, CF, CG, DP,
    output [7:0] AN
);

    reg [10:0] hcnt;
    reg [7:0] lpos;
    reg [31:0] cnt;
    reg [7:0] rseg;

    assign AN = ~lpos;

    always @(posedge clk) begin
        if (hcnt == 11'h7FF) begin
            hcnt <= 0;
            lpos <= {lpos[6:0], lpos[7]};
        end else begin
            hcnt <= hcnt + 1;
        end
    end

    always @(posedge clk) begin
        if (SW[0])
            cnt <= 0;
        else if (SW[1] && lpos[7])
            cnt <= cnt + {24'b0, SW[9:2]};
    end

    function [7:0] enc;
        input [1:0] val;
        case (val)
            2'b00: enc = 8'b11000000;
            2'b01: enc = 8'b11111001;
            2'b10: enc = 8'b10100100;
            2'b11: enc = 8'b10110000;
        endcase
    endfunction

    always @* begin
        case (lpos)
            8'b10000000: rseg = enc(cnt[1:0]);
            8'b01000000: rseg = enc(cnt[3:2]);
            8'b00100000: rseg = enc(cnt[5:4]);
            8'b00010000: rseg = enc(cnt[7:6]);
            8'b00001000: rseg = enc(cnt[9:8]);
            8'b00000100: rseg = enc(cnt[11:10]);
            8'b00000010: rseg = enc(cnt[13:12]);
            8'b00000001: rseg = enc(cnt[15:14]);
            default: rseg = 8'b11111111;
        endcase
    end

    assign {CA, CB, CC, CD, CE, CF, CG, DP} = rseg;

endmodule
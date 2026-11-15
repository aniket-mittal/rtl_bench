module origen_026143 (
    input wire rst,
    input wire clk,
    input wire [1:0] prio,
    input wire [1:0] req,
    input wire [1:0] using,
    output reg [1:0] en
);

    parameter RR = 400000;

    reg switch;
    reg [18:0] cnt;
    reg target;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            en <= 2'b00;
            switch <= 1'b0;
            cnt <= 19'd0;
            target <= 1'b0;
        end else begin
            if (switch) begin
                if (!using[target]) begin
                    en[target] <= 1'b1;
                    en[!target] <= 1'b0;
                    switch <= 1'b0;
                    cnt <= 19'd0;
                end
            end else if (|en) begin
                if (cnt == RR - 1 && req[!target]) begin
                    switch <= 1'b1;
                    target <= !target;
                end else if (cnt != RR - 1) begin
                    cnt <= cnt + 1'b1;
                end
            end else if (req[0] && (!en[1] || prio[0])) begin
                switch <= 1'b1;
                target <= 1'b0;
            end else if (req[1] && (!en[0] || prio[1])) begin
                switch <= 1'b1;
                target <= 1'b1;
            end

            if (prio[!target] && req[!target] && !using[target]) begin
                switch <= 1'b1;
                target <= !target;
            end
        end
    end

endmodule
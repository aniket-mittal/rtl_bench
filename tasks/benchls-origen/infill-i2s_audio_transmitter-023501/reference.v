module origen_023501 (
    input wire AUD_XCK,
    input wire reset_n,
    input wire [15:0] audiodata,
    output reg AUD_BCK,
    output reg AUD_DATA,
    output reg AUD_LRCK
);

    reg [2:0] bck_counter;
    reg [4:0] lr_counter;
    reg [3:0] bitaddr;

    always @(posedge AUD_XCK or negedge reset_n) begin
        if (!reset_n) begin
            bck_counter <= 3'd0;
            AUD_BCK <= 1'b0;
        end else begin
            if (bck_counter == 3'd5) begin
                bck_counter <= 3'd0;
                AUD_BCK <= ~AUD_BCK;
            end else begin
                bck_counter <= bck_counter + 1'b1;
            end
        end
    end

    always @(posedge AUD_BCK or negedge reset_n) begin
        if (!reset_n) begin
            lr_counter <= 5'd0;
            AUD_LRCK <= 1'b0;
        end else begin
            if (lr_counter == 5'd15) begin
                lr_counter <= 5'd0;
                AUD_LRCK <= ~AUD_LRCK;
            end else begin
                lr_counter <= lr_counter + 1'b1;
            end
        end
    end

    always @(*) begin
        bitaddr = 4'd15 - lr_counter[3:0];
    end

    always @(negedge AUD_BCK or negedge reset_n) begin
        if (!reset_n) begin
            AUD_DATA <= 1'b0;
        end else begin
            AUD_DATA <= audiodata[bitaddr];
        end
    end

endmodule
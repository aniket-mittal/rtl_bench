module origen_090636 (
    input [7:0] mac0, mac1, mac2, mac3, mac4, mac5, mac6, mac7, mac8, mac9,
    output reg [7:0] calculated_class
);

    reg [7:0] temp_val;

    always @(*) begin
        temp_val = 8'd0;
        calculated_class = 8'd0;

        if (mac0 > temp_val) begin
            temp_val = mac0;
            calculated_class = 8'd0;
        end

        if (mac1 > temp_val) begin
            temp_val = mac1;
            calculated_class = 8'd1;
        end

        if (mac2 > temp_val) begin
            temp_val = mac2;
            calculated_class = 8'd2;
        end

        if (mac3 > temp_val) begin
            temp_val = mac3;
            calculated_class = 8'd3;
        end

        if (mac4 > temp_val) begin
            temp_val = mac4;
            calculated_class = 8'd4;
        end

        if (mac5 > temp_val) begin
            temp_val = mac5;
            calculated_class = 8'd5;
        end

        if (mac6 > temp_val) begin
            temp_val = mac6;
            calculated_class = 8'd6;
        end

        if (mac7 > temp_val) begin
            temp_val = mac7;
            calculated_class = 8'd7;
        end

        if (mac8 > temp_val) begin
            temp_val = mac8;
            calculated_class = 8'd8;
        end

        if (mac9 > temp_val) begin
            temp_val = mac9;
            calculated_class = 8'd9;
        end
    end

endmodule
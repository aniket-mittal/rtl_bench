module origen_097574(
    input A, S, D, F, G, H, J,
    output reg [3:0] note,
    output reg [7:0] volume,
    output reg [6:0] keyArray
);

always @(*) begin
    // Default values
    note = 4'b0000;
    volume = 8'b0;
    keyArray = 7'b0000000;

    // Priority encoded key detection
    if (A) begin
        note = 4'd0;
        volume = 8'd255;
        keyArray = 7'b0000001;
    end
    else if (S) begin
        note = 4'd1;
        volume = 8'd255;
        keyArray = 7'b0000010;
    end
    else if (D) begin
        note = 4'd2;
        volume = 8'd255;
        keyArray = 7'b0000100;
    end
    else if (F) begin
        note = 4'd3;
        volume = 8'd255;
        keyArray = 7'b0001000;
    end
    else if (G) begin
        note = 4'd4;
        volume = 8'd255;
        keyArray = 7'b0010000;
    end
    else if (H) begin
        note = 4'd5;
        volume = 8'd255;
        keyArray = 7'b0100000;
    end
    else if (J) begin
        note = 4'd6;
        volume = 8'd255;
        keyArray = 7'b1000000;
    end
end

endmodule
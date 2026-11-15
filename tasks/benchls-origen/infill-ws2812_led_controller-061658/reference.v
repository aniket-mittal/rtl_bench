module origen_061658 (
    input wire clk,
    input wire rst,
    input wire ShipGRB,
    input wire ShipClr,
    input wire bdone,
    output reg Done,
    output reg allDone,
    output reg nextLED,
    output reg changeColor,
    output reg lost,
    output reg loadColor,
    output reg loadClr,
    output reg ClrCounter,
    output reg StartCoding,
    output reg ShiftPattern,
    output reg IncCounter,
    output reg qmode
);

    // Parameters
    parameter SSHIPRET = 1'b0;
    parameter SSHIPGRB = 1'b1;
    parameter COMPAREVAL = 239; // Maximum bits per LED

    // Registers
    reg state;
    reg [14:0] rCount;
    reg [3:0] lCount;
    reg [22:0] dCount;
    reg [7:0] Count; // Added Count register

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= SSHIPRET;
            rCount <= 15'd0;
            lCount <= 4'd0;
            dCount <= 23'd0;
            Count <= 8'd0; // Initialize Count
            Done <= 1'b0;
            allDone <= 1'b0;
            nextLED <= 1'b0;
            changeColor <= 1'b0;
            lost <= 1'b0;
            loadColor <= 1'b0;
            loadClr <= 1'b0;
            ClrCounter <= 1'b0;
            StartCoding <= 1'b0;
            ShiftPattern <= 1'b0;
            IncCounter <= 1'b0;
            qmode <= 1'b0;
        end else begin
            case (state)
                SSHIPRET: begin
                    if (ShipGRB) begin
                        state <= SSHIPGRB;
                        StartCoding <= 1'b1;
                        qmode <= 1'b1;
                    end else if (ShipClr) begin
                        loadClr <= 1'b1;
                    end else begin
                        loadColor <= 1'b1;
                    end

                    if (rCount == 15'd28100) begin
                        allDone <= 1'b1;
                        rCount <= 15'd0;
                    end

                    if (dCount == 23'd5000000) begin
                        nextLED <= 1'b1;
                        dCount <= 23'd0;
                        lCount <= lCount + 1'b1;
                        if (lCount == 4'd10) begin
                            changeColor <= 1'b1;
                            lCount <= 4'd0;
                        end
                    end else begin
                        dCount <= dCount + 1'b1;
                    end

                    if (lCount == 4'd11) begin
                        lost <= 1'b1;
                    end
                end

                SSHIPGRB: begin
                    StartCoding <= 1'b0;
                    if (bdone) begin
                        if (Count == COMPAREVAL) begin
                            state <= SSHIPRET;
                            Done <= 1'b1;
                            ClrCounter <= 1'b1;
                            qmode <= 1'b0;
                            Count <= 8'd0; // Reset Count
                        end else begin
                            ShiftPattern <= 1'b1;
                            IncCounter <= 1'b1;
                            Count <= Count + 1'b1; // Increment Count
                        end
                    end
                end
            endcase

            rCount <= rCount + 1'b1;
        end
    end

endmodule
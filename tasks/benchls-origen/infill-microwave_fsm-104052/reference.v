module origen_104052 (
    input wire clk,
    input wire nrst,
    input wire door,
    input wire start,
    input wire finish,
    output wire heat,
    output wire light,
    output wire bell
);

    // State register
    reg [4:0] q;

    // Next state logic
    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            q <= 5'b00001; // Reset to Idle state
        end else begin
            case (1'b1) // One-hot encoding
                q[0]: begin // Idle
                    if (door) q <= 5'b00010; // To Door open
                    else if (start && !door) q <= 5'b00100; // To Cooking
                    else q <= q;
                end
                q[1]: begin // Door open
                    if (!door) q <= 5'b00001; // To Idle
                    else q <= q;
                end
                q[2]: begin // Cooking
                    if (finish && !door) q <= 5'b01000; // To Finished cooking
                    else if (door) q <= 5'b10000; // To Door opened during cooking
                    else q <= q;
                end
                q[3]: begin // Finished cooking
                    if (door) q <= 5'b00010; // To Door open
                    else q <= q;
                end
                q[4]: begin // Door opened during cooking
                    if (!door) q <= 5'b00100; // To Cooking
                    else q <= q;
                end
                default: q <= 5'b00001; // Default to Idle state
            endcase
        end
    end

    // Output logic
    assign heat = q[2];
    assign light = q[2] | q[1] | q[4];
    assign bell = q[3];

endmodule
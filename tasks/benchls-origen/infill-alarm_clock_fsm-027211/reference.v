module origen_027211 (
    input wire clk,
    input wire reset_,
    input wire STOP,
    input wire Snooze,
    input wire Trigger,
    output reg buzz,
    output reg feedback
);

    // State definitions
    localparam [1:0] Idle = 2'b00, Suna = 2'b01, Taci = 2'b10;
    localparam [1:0] Asteapta = 2'b00, Numara = 2'b01;

    reg [1:0] state_ff, state_next;
    reg [1:0] state_feed_ff, state_feed_next;
    reg [13:0] nrTaci_ff, nrTaci_next;
    reg [13:0] nrFeed_ff, nrFeed_next;
    reg triggNr_ff, triggNr_next;

    // Main Alarm State Machine
    always @(posedge clk or negedge reset_) begin
        if (!reset_) begin
            state_ff <= Idle;
            nrTaci_ff <= 14'b0;
        end else begin
            state_ff <= state_next;
            nrTaci_ff <= nrTaci_next;
        end
    end

    always @(*) begin
        state_next = state_ff;
        nrTaci_next = nrTaci_ff;
        buzz = 1'b0;

        case (state_ff)
            Idle: begin
                if (Trigger)
                    state_next = Suna;
            end
            Suna: begin
                buzz = 1'b1;
                if (STOP)
                    state_next = Idle;
                else if (Snooze) begin
                    state_next = Taci;
                    nrTaci_next = 14'b10011100010000; // Snooze duration
                end
            end
            Taci: begin
                if (STOP)
                    state_next = Idle;
                else if (nrTaci_ff == 14'b0)
                    state_next = Suna;
                else
                    nrTaci_next = nrTaci_ff - 1'b1;
            end
        endcase
    end

    // Feedback State Machine
    always @(posedge clk or negedge reset_) begin
        if (!reset_) begin
            state_feed_ff <= Asteapta;
            nrFeed_ff <= 14'b0;
            triggNr_ff <= 1'b0;
        end else begin
            state_feed_ff <= state_feed_next;
            nrFeed_ff <= nrFeed_next;
            triggNr_ff <= triggNr_next;
        end
    end

    always @(*) begin
        state_feed_next = state_feed_ff;
        nrFeed_next = nrFeed_ff;
        triggNr_next = triggNr_ff;
        feedback = 1'b0;

        case (state_feed_ff)
            Asteapta: begin
                if (Trigger && !triggNr_ff) begin
                    state_feed_next = Numara;
                    nrFeed_next = 14'b10011100010000; // Feedback duration
                    triggNr_next = 1'b1;
                end else if (!Trigger)
                    triggNr_next = 1'b0;
            end
            Numara: begin
                feedback = 1'b1;
                if (nrFeed_ff == 14'b0)
                    state_feed_next = Asteapta;
                else
                    nrFeed_next = nrFeed_ff - 1'b1;
            end
        endcase
    end

endmodule
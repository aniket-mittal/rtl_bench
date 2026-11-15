module origen_114728 (
    input wire north_hit_i,
    input wire east_hit_i,
    input wire west_hit_i,
    input wire south_hit_i,
    input wire local_hit_i,
    input wire [4:0] last_dir_i,
    input wire [4:0] is_body_i,
    output reg [4:0] dir_o,
    output reg [4:0] filter_o,
    output reg arb_o
);

    wire [4:0] hit;
    assign hit = {north_hit_i, east_hit_i, west_hit_i, south_hit_i, local_hit_i};

    always @(*) begin
        // Arbitration logic
        arb_o = (hit[4] + hit[3] + hit[2] + hit[1] + hit[0]) > 1;

        if (arb_o) begin
            // Arbitration required
            if (|(hit & is_body_i)) begin
                // Body bit set and corresponding hit signal active
                casez (hit & is_body_i)
                    5'b1????: dir_o = 5'b10000; // North
                    5'b01???: dir_o = 5'b01000; // East
                    5'b001??: dir_o = 5'b00100; // West
                    5'b0001?: dir_o = 5'b00010; // South
                    5'b00001: dir_o = 5'b00001; // Local
                    default:  dir_o = 5'b00000; // Should not occur
                endcase
            end else begin
                // No body bits set, use last_dir_i for priority
                case (last_dir_i)
                    5'b10000: // Last direction was North
                        casez (hit)
                            5'b1????: dir_o = 5'b10000; // North
                            5'b01???: dir_o = 5'b01000; // East
                            5'b001??: dir_o = 5'b00100; // West
                            5'b0001?: dir_o = 5'b00010; // South
                            5'b00001: dir_o = 5'b00001; // Local
                            default:  dir_o = 5'b00000; // Should not occur
                        endcase
                    5'b01000: // Last direction was East
                        casez (hit)
                            5'b?1???: dir_o = 5'b01000; // East
                            5'b1????: dir_o = 5'b10000; // North
                            5'b??1??: dir_o = 5'b00100; // West
                            5'b???1?: dir_o = 5'b00010; // South
                            5'b????1: dir_o = 5'b00001; // Local
                            default:  dir_o = 5'b00000; // Should not occur
                        endcase
                    5'b00100: // Last direction was West
                        casez (hit)
                            5'b??1??: dir_o = 5'b00100; // West
                            5'b1????: dir_o = 5'b10000; // North
                            5'b?1???: dir_o = 5'b01000; // East
                            5'b???1?: dir_o = 5'b00010; // South
                            5'b????1: dir_o = 5'b00001; // Local
                            default:  dir_o = 5'b00000; // Should not occur
                        endcase
                    5'b00010: // Last direction was South
                        casez (hit)
                            5'b???1?: dir_o = 5'b00010; // South
                            5'b1????: dir_o = 5'b10000; // North
                            5'b?1???: dir_o = 5'b01000; // East
                            5'b??1??: dir_o = 5'b00100; // West
                            5'b????1: dir_o = 5'b00001; // Local
                            default:  dir_o = 5'b00000; // Should not occur
                        endcase
                    5'b00001: // Last direction was Local
                        casez (hit)
                            5'b????1: dir_o = 5'b00001; // Local
                            5'b1????: dir_o = 5'b10000; // North
                            5'b?1???: dir_o = 5'b01000; // East
                            5'b??1??: dir_o = 5'b00100; // West
                            5'b???1?: dir_o = 5'b00010; // South
                            default:  dir_o = 5'b00000; // Should not occur
                        endcase
                    default: dir_o = 5'b00000; // Should not occur
                endcase
            end
            filter_o = hit & ~dir_o;
        end else begin
            // No arbitration required
            dir_o = last_dir_i;
            filter_o = 5'b00000;
        end
    end

endmodule
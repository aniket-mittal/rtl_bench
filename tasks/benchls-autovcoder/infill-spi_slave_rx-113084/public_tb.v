// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113084 dut (
    .clk_in(clk),
    .spi_sclk(in_vec[11:11]),
    .spi_mosi(in_vec[10:10]),
    .spi_n_ss(in_vec[9:9]),
    .tx_buffer(in_vec[8:1]),
    .rx_ready_ack(in_vec[0:0]),
    .spi_miso(out_vec[10:10]),
    .rx_buffer(out_vec[9:2]),
    .rx_ready(out_vec[1:1]),
    .nss_risen_stable_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hfad;
    stim[1] = 12'hd8f;
    stim[2] = 12'h0f6;
    stim[3] = 12'h5c3;
    stim[4] = 12'h74e;
    stim[5] = 12'h5dd;
    stim[6] = 12'haa2;
    stim[7] = 12'hf29;
    stim[8] = 12'h692;
    stim[9] = 12'ha49;
    stim[10] = 12'h70d;
    stim[11] = 12'hca6;
    stim[12] = 12'h7f5;
    stim[13] = 12'h2f6;
    stim[14] = 12'hcd0;
    stim[15] = 12'h02d;
    stim[16] = 12'h042;
    stim[17] = 12'h3b9;
    stim[18] = 12'h968;
    stim[19] = 12'hd1a;
    stim[20] = 12'h52b;
    stim[21] = 12'h21f;
    stim[22] = 12'hba5;
    stim[23] = 12'h0b4;
    stim[24] = 12'hc35;
    stim[25] = 12'h2e9;
    stim[26] = 12'hd0c;
    stim[27] = 12'he35;
    stim[28] = 12'hcd7;
    stim[29] = 12'he31;
    stim[30] = 12'h3bf;
    stim[31] = 12'hb47;
    stim[32] = 12'h255;
    stim[33] = 12'hb87;
    stim[34] = 12'h0c5;
    stim[35] = 12'hb01;
    stim[36] = 12'h91c;
    stim[37] = 12'h2a5;
    stim[38] = 12'h9d5;
    stim[39] = 12'hc19;
    stim[40] = 12'h8a8;
    stim[41] = 12'h6a4;
    stim[42] = 12'ha61;
    stim[43] = 12'h7e9;
    stim[44] = 12'hdde;
    stim[45] = 12'he59;
    stim[46] = 12'hb87;
    stim[47] = 12'h5ca;
    stim[48] = 12'h19d;
    stim[49] = 12'h290;
    stim[50] = 12'h002;
    stim[51] = 12'h3a6;
    stim[52] = 12'h3e2;
    stim[53] = 12'h5e3;
    stim[54] = 12'h034;
    stim[55] = 12'h01d;
    stim[56] = 12'h91c;
    stim[57] = 12'h854;
    stim[58] = 12'h8fe;
    stim[59] = 12'h4c5;
    stim[60] = 12'h8f1;
    stim[61] = 12'hefe;
    stim[62] = 12'hdd9;
    stim[63] = 12'h546;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 11'h00x;
      expv[1] = 11'h00x;
      expv[2] = 11'h00x;
      expv[3] = 11'h000;
      expv[4] = 11'h400;
      expv[5] = 11'h400;
      expv[6] = 11'h400;
      expv[7] = 11'h000;
      expv[8] = 11'h400;
      expv[9] = 11'h001;
      expv[10] = 11'hx00;
      expv[11] = 11'h400;
      expv[12] = 11'h600;
      expv[13] = 11'h600;
      expv[14] = 11'hx00;
      expv[15] = 11'hx01;
      expv[16] = 11'hx00;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h100;
      expv[22] = 11'hx00;
      expv[23] = 11'hx00;
      expv[24] = 11'hx01;
      expv[25] = 11'h180;
      expv[26] = 11'h180;
      expv[27] = 11'h380;
      expv[28] = 11'h380;
      expv[29] = 11'h380;
      expv[30] = 11'h380;
      expv[31] = 11'h380;
      expv[32] = 11'hx81;
      expv[33] = 11'hx80;
      expv[34] = 11'hx80;
      expv[35] = 11'h380;
      expv[36] = 11'hx80;
      expv[37] = 11'h780;
      expv[38] = 11'h380;
      expv[39] = 11'h780;
      expv[40] = 11'h380;
      expv[41] = 11'h180;
      expv[42] = 11'h180;
      expv[43] = 11'hx80;
      expv[44] = 11'hx81;
      expv[45] = 11'h180;
      expv[46] = 11'h180;
      expv[47] = 11'h580;
      expv[48] = 11'h581;
      expv[49] = 11'h580;
      expv[50] = 11'h180;
      expv[51] = 11'h180;
      expv[52] = 11'h580;
      expv[53] = 11'h580;
      expv[54] = 11'h581;
      expv[55] = 11'h180;
      expv[56] = 11'h180;
      expv[57] = 11'h580;
      expv[58] = 11'h180;
      expv[59] = 11'h180;
      expv[60] = 11'h180;
      expv[61] = 11'h580;
      expv[62] = 11'h580;
      expv[63] = 11'h580;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule

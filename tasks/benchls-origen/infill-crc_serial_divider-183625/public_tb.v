// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183625 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .polynom(in_vec[34:23]),
    .datain_a(in_vec[22:12]),
    .datain_b(in_vec[11:1]),
    .enable(in_vec[0:0]),
    .dataout(out_vec[11:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hfef87411a;
    stim[1] = 36'hcc8e0df42;
    stim[2] = 36'h1f37a2c9d;
    stim[3] = 36'h2e4a1b766;
    stim[4] = 36'h47ef622cc;
    stim[5] = 36'h30ca5ca27;
    stim[6] = 36'h0c266755e;
    stim[7] = 36'h78fc0985f;
    stim[8] = 36'h079ae44b8;
    stim[9] = 36'h488fbf7b0;
    stim[10] = 36'h481b255d9;
    stim[11] = 36'h3ae455286;
    stim[12] = 36'h116254313;
    stim[13] = 36'h123655826;
    stim[14] = 36'h3348da3a1;
    stim[15] = 36'h7a301d444;
    stim[16] = 36'hca77710bf;
    stim[17] = 36'h62c99b7e6;
    stim[18] = 36'h216a06d08;
    stim[19] = 36'h76b18ba10;
    stim[20] = 36'h71d61e912;
    stim[21] = 36'h575b08265;
    stim[22] = 36'h6697952d9;
    stim[23] = 36'h01ec267cb;
    stim[24] = 36'h050c905e0;
    stim[25] = 36'h218b9358e;
    stim[26] = 36'h49d05c351;
    stim[27] = 36'h428b2dbf0;
    stim[28] = 36'h4bf28277d;
    stim[29] = 36'h1c4220a2f;
    stim[30] = 36'h13f5816cb;
    stim[31] = 36'h6e72952d4;
    stim[32] = 36'h4639b5187;
    stim[33] = 36'h460580eef;
    stim[34] = 36'h69f8d8780;
    stim[35] = 36'h6dfab9ff0;
    stim[36] = 36'h6de8db3aa;
    stim[37] = 36'h42f794073;
    stim[38] = 36'h7ac9d43a1;
    stim[39] = 36'h4ffd02350;
    stim[40] = 36'h60218829e;
    stim[41] = 36'h55d254211;
    stim[42] = 36'h11adcb087;
    stim[43] = 36'h42a5cea21;
    stim[44] = 36'h5c032e76a;
    stim[45] = 36'h75e4c7d5b;
    stim[46] = 36'h053985b56;
    stim[47] = 36'h0701f68b4;
    stim[48] = 36'h458cf25ab;
    stim[49] = 36'h4fe1ffa2d;
    stim[50] = 36'h2ea3d977f;
    stim[51] = 36'h5bfedc5ef;
    stim[52] = 36'h2c27e5ae3;
    stim[53] = 36'hbde8479d8;
    stim[54] = 36'h59e722ee0;
    stim[55] = 36'h663a10c8c;
    stim[56] = 36'h4047a69d1;
    stim[57] = 36'h29cc6a342;
    stim[58] = 36'hbd5b1b35e;
    stim[59] = 36'h08f216d1d;
    stim[60] = 36'h271661c19;
    stim[61] = 36'h4a1955362;
    stim[62] = 36'h5977adf45;
    stim[63] = 36'he3dc34981;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h002;
      expv[7] = 12'h002;
      expv[8] = 12'h006;
      expv[9] = 12'h006;
      expv[10] = 12'h006;
      expv[11] = 12'h00e;
      expv[12] = 12'h00e;
      expv[13] = 12'h01e;
      expv[14] = 12'h01e;
      expv[15] = 12'h03c;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h002;
      expv[25] = 12'h002;
      expv[26] = 12'h002;
      expv[27] = 12'h006;
      expv[28] = 12'h006;
      expv[29] = 12'h00c;
      expv[30] = 12'h018;
      expv[31] = 12'h030;
      expv[32] = 12'h030;
      expv[33] = 12'h060;
      expv[34] = 12'h0c2;
      expv[35] = 12'h0c2;
      expv[36] = 12'h0c2;
      expv[37] = 12'h0c2;
      expv[38] = 12'h184;
      expv[39] = 12'h308;
      expv[40] = 12'h308;
      expv[41] = 12'h308;
      expv[42] = 12'h610;
      expv[43] = 12'h610;
      expv[44] = 12'h3c7;
      expv[45] = 12'h3c7;
      expv[46] = 12'h3c7;
      expv[47] = 12'h3c7;
      expv[48] = 12'h3c7;
      expv[49] = 12'h78f;
      expv[50] = 12'hf1d;
      expv[51] = 12'he39;
      expv[52] = 12'hc73;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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

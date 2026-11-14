// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059928 dut (
    .clk(clk),
    .rst(in_vec[74:74]),
    .DataIn(in_vec[73:66]),
    .Write0(in_vec[65:65]),
    .Write1(in_vec[64:64]),
    .BlockEnable(in_vec[63:0]),
    .DataOut0(out_vec[15:8]),
    .DataOut1(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h76f57a74cd0e77693a4;
    stim[1] = 75'h5571c658b64f5fa9e23;
    stim[2] = 75'h205e106b12d487bd601;
    stim[3] = 75'h229b439564c381b7481;
    stim[4] = 75'h3b65d5f082ff3685938;
    stim[5] = 75'h2ec156527c70e016b8b;
    stim[6] = 75'h34bd0d9273641ea4d53;
    stim[7] = 75'h1ccd5fc4dfc350fc67d;
    stim[8] = 75'h2e0a1e50685308160b5;
    stim[9] = 75'h1ecfc28b828ed0c1a82;
    stim[10] = 75'h6e2f719ca86ccafcce9;
    stim[11] = 75'h32194fffc75531e87de;
    stim[12] = 75'h2ae487ffd738001c81d;
    stim[13] = 75'h1a9f0ec0b4915f06155;
    stim[14] = 75'h25e02baee598b6ee9f3;
    stim[15] = 75'h148be5cd2f637a7b39f;
    stim[16] = 75'h095990ac353309da9c6;
    stim[17] = 75'h10f05c464249eb08111;
    stim[18] = 75'h0b9cc27e49443db0ac8;
    stim[19] = 75'h2f0c2fbc702df4b5d12;
    stim[20] = 75'h06a8eb406b1e6cb046b;
    stim[21] = 75'h045a7afe5e541fe4064;
    stim[22] = 75'h0187c7b2b4722a1aa79;
    stim[23] = 75'h1062e843404801b1df1;
    stim[24] = 75'h0d3fe145501d0c8b971;
    stim[25] = 75'h02d592a61dea3bc4533;
    stim[26] = 75'h020603cbfe48d3df450;
    stim[27] = 75'h28df42fde89f88c7c10;
    stim[28] = 75'h1c9ac3c649236af0d2b;
    stim[29] = 75'h1af83b20b9e6fc4bd11;
    stim[30] = 75'h211f23cd0df75c5b3db;
    stim[31] = 75'h3cc7cbe314b8eaef4c8;
    stim[32] = 75'h21d8e1e6e0d83f9fedd;
    stim[33] = 75'h2c61d1e3fa5d633a2ff;
    stim[34] = 75'h200743a262073f403d9;
    stim[35] = 75'h22c04382c571b9a7149;
    stim[36] = 75'h2b7286f2c3136970373;
    stim[37] = 75'h1475ee0feac5f1e4f8e;
    stim[38] = 75'h079b198c454c29a295b;
    stim[39] = 75'h17a19df18c79dd77457;
    stim[40] = 75'h318646c1a4d2abb407f;
    stim[41] = 75'h1ef7c7efd14632a5250;
    stim[42] = 75'h147ef98131d2f3fda6d;
    stim[43] = 75'h09be47258d4d97d9a61;
    stim[44] = 75'h0e478b35437af130ebe;
    stim[45] = 75'h22d4a21ea4bfee5ab69;
    stim[46] = 75'h3da1f121fa6db8ad776;
    stim[47] = 75'h1904d59a15af7749790;
    stim[48] = 75'h2bed1776f895c4034af;
    stim[49] = 75'h06e2e4a05f39eb857f8;
    stim[50] = 75'h0628cca76978486faa0;
    stim[51] = 75'h0ecadee544bcbc17017;
    stim[52] = 75'h1d35ea0f9f9ffea5863;
    stim[53] = 75'h133e8d32adc96b3f280;
    stim[54] = 75'h289ca860b05094f4cb8;
    stim[55] = 75'h3b6a57ff03bb67e64a5;
    stim[56] = 75'h3eefd25258fb5f36f48;
    stim[57] = 75'h07948b6d49d223a45a2;
    stim[58] = 75'h11a820192900c9e9156;
    stim[59] = 75'h06fc1e9e20ce2f2c31a;
    stim[60] = 75'h2d5618ce4cc14016a46;
    stim[61] = 75'h15ae1ecdc77c4d855cd;
    stim[62] = 75'h3fd3ae433ad96e62b12;
    stim[63] = 75'h30b72ac4bc23c0a6508;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'h00xx;
      expv[3] = 16'h00xx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxx00;
      expv[11] = 16'hx0xx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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

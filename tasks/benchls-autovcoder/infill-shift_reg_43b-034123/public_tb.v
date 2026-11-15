// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034123 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h71626fc96d2;
    stim[1] = 43'h463b8a56718;
    stim[2] = 43'h31b6d7e480c;
    stim[3] = 43'h33449c233a3;
    stim[4] = 43'h495942da116;
    stim[5] = 43'h45b030d054f;
    stim[6] = 43'h4549455ce04;
    stim[7] = 43'h213d806b607;
    stim[8] = 43'h2014efbf5cc;
    stim[9] = 43'h473903fda37;
    stim[10] = 43'h5f78b64322b;
    stim[11] = 43'h7199036d8cf;
    stim[12] = 43'h628dd04ceec;
    stim[13] = 43'h431b2ef668a;
    stim[14] = 43'h3ec697dc677;
    stim[15] = 43'h4b65e947563;
    stim[16] = 43'h45291cab222;
    stim[17] = 43'h30656405bc9;
    stim[18] = 43'h0e1dea5d4ca;
    stim[19] = 43'h419e2c09552;
    stim[20] = 43'h15056198e7c;
    stim[21] = 43'h4d507f8f153;
    stim[22] = 43'h1eda0d86b19;
    stim[23] = 43'h5f34d27e1dd;
    stim[24] = 43'h5b1eb681def;
    stim[25] = 43'h26718aa4483;
    stim[26] = 43'h6e057db5494;
    stim[27] = 43'h77713c0c061;
    stim[28] = 43'h4e172b9a48d;
    stim[29] = 43'h5e21ee943b9;
    stim[30] = 43'h7f720b27ed8;
    stim[31] = 43'h239790714ec;
    stim[32] = 43'h1d511e6cfd5;
    stim[33] = 43'h6d84914639a;
    stim[34] = 43'h33d1fc73de4;
    stim[35] = 43'h6642c92fe07;
    stim[36] = 43'h1eaa18b298e;
    stim[37] = 43'h248d7a6cbe9;
    stim[38] = 43'h00c4ee27a64;
    stim[39] = 43'h0cc637bfd84;
    stim[40] = 43'h3199b731426;
    stim[41] = 43'h1de1458bdbc;
    stim[42] = 43'h1f56b5c6b4b;
    stim[43] = 43'h3c73c08f593;
    stim[44] = 43'h29e19c57ff3;
    stim[45] = 43'h027da97f4fa;
    stim[46] = 43'h63f05070eec;
    stim[47] = 43'h3cdd5ab3113;
    stim[48] = 43'h7df21759164;
    stim[49] = 43'h13c11e055b1;
    stim[50] = 43'h424759f0130;
    stim[51] = 43'h39612105c92;
    stim[52] = 43'h1a52fa7d2d4;
    stim[53] = 43'h2a0f9593010;
    stim[54] = 43'h4744a37bc5c;
    stim[55] = 43'h2a40dea8cd2;
    stim[56] = 43'h71dc396e095;
    stim[57] = 43'h78e47a1b63b;
    stim[58] = 43'h26a1c6192ec;
    stim[59] = 43'h31ca3d466cb;
    stim[60] = 43'h7075350b856;
    stim[61] = 43'h75f32abf717;
    stim[62] = 43'h78f93e66244;
    stim[63] = 43'h34790af04f6;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h71626fc96d2;
      expv[2] = 43'h463b8a56718;
      expv[3] = 43'h31b6d7e480c;
      expv[4] = 43'h33449c233a3;
      expv[5] = 43'h495942da116;
      expv[6] = 43'h45b030d054f;
      expv[7] = 43'h4549455ce04;
      expv[8] = 43'h213d806b607;
      expv[9] = 43'h2014efbf5cc;
      expv[10] = 43'h473903fda37;
      expv[11] = 43'h5f78b64322b;
      expv[12] = 43'h7199036d8cf;
      expv[13] = 43'h628dd04ceec;
      expv[14] = 43'h431b2ef668a;
      expv[15] = 43'h3ec697dc677;
      expv[16] = 43'h4b65e947563;
      expv[17] = 43'h45291cab222;
      expv[18] = 43'h30656405bc9;
      expv[19] = 43'h0e1dea5d4ca;
      expv[20] = 43'h419e2c09552;
      expv[21] = 43'h15056198e7c;
      expv[22] = 43'h4d507f8f153;
      expv[23] = 43'h1eda0d86b19;
      expv[24] = 43'h5f34d27e1dd;
      expv[25] = 43'h5b1eb681def;
      expv[26] = 43'h26718aa4483;
      expv[27] = 43'h6e057db5494;
      expv[28] = 43'h77713c0c061;
      expv[29] = 43'h4e172b9a48d;
      expv[30] = 43'h5e21ee943b9;
      expv[31] = 43'h7f720b27ed8;
      expv[32] = 43'h239790714ec;
      expv[33] = 43'h1d511e6cfd5;
      expv[34] = 43'h6d84914639a;
      expv[35] = 43'h33d1fc73de4;
      expv[36] = 43'h6642c92fe07;
      expv[37] = 43'h1eaa18b298e;
      expv[38] = 43'h248d7a6cbe9;
      expv[39] = 43'h00c4ee27a64;
      expv[40] = 43'h0cc637bfd84;
      expv[41] = 43'h3199b731426;
      expv[42] = 43'h1de1458bdbc;
      expv[43] = 43'h1f56b5c6b4b;
      expv[44] = 43'h3c73c08f593;
      expv[45] = 43'h29e19c57ff3;
      expv[46] = 43'h027da97f4fa;
      expv[47] = 43'h63f05070eec;
      expv[48] = 43'h3cdd5ab3113;
      expv[49] = 43'h7df21759164;
      expv[50] = 43'h13c11e055b1;
      expv[51] = 43'h424759f0130;
      expv[52] = 43'h39612105c92;
      expv[53] = 43'h1a52fa7d2d4;
      expv[54] = 43'h2a0f9593010;
      expv[55] = 43'h4744a37bc5c;
      expv[56] = 43'h2a40dea8cd2;
      expv[57] = 43'h71dc396e095;
      expv[58] = 43'h78e47a1b63b;
      expv[59] = 43'h26a1c6192ec;
      expv[60] = 43'h31ca3d466cb;
      expv[61] = 43'h7075350b856;
      expv[62] = 43'h75f32abf717;
      expv[63] = 43'h78f93e66244;
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

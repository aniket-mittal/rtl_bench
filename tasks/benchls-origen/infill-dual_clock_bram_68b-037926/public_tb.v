// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 90;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_037926 dut (
    .wr_clk(clk),
    .rd_clk(in_vec[89:89]),
    .wr_addr(in_vec[88:80]),
    .rd_addr(in_vec[79:71]),
    .data_in(in_vec[70:7]),
    .ctrl_in(in_vec[6:3]),
    .wr_allow(in_vec[2:2]),
    .rd_allow(in_vec[1:1]),
    .rd_sreset(in_vec[0:0]),
    .data_out(out_vec[67:4]),
    .ctrl_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 90'h3a5803d2e7a37ab22fd2d2f;
    stim[1] = 90'h2f17c9ffce08e2629cfba19;
    stim[2] = 90'h3f2dc0562540ae470bc91fc;
    stim[3] = 90'h367b73aa871f6ea8518d176;
    stim[4] = 90'h0a5a88dc6b60792f3eb7a70;
    stim[5] = 90'h22dd388bd4af66af4580ad0;
    stim[6] = 90'h063082e43f01fa1d636c36e;
    stim[7] = 90'h0d9a2b6382b0bf4e3fc1a76;
    stim[8] = 90'h2de26b8c0ac46122335f418;
    stim[9] = 90'h1b70bdebcc0dab08a20d662;
    stim[10] = 90'h12c13a751b3f331e23b4fb0;
    stim[11] = 90'h007c81e530fa330b0bcacc2;
    stim[12] = 90'h24e1ddf8dcaa7685a554020;
    stim[13] = 90'h3f8607ebf66caecddd9563e;
    stim[14] = 90'h1f39e5a95aa040c5b76f932;
    stim[15] = 90'h1ba68058b9c3e82376fb74a;
    stim[16] = 90'h34d528882204cd0450cbbd4;
    stim[17] = 90'h1e9ce62bc2ee5ee4cd92130;
    stim[18] = 90'h1984e0bac209d2737271888;
    stim[19] = 90'h36eb9aa12cc0c6fd00bcaca;
    stim[20] = 90'h00e8d07482ef8413c268101;
    stim[21] = 90'h0f8ffbd287ba403b326bf4e;
    stim[22] = 90'h2a4d74419e213e45ac40488;
    stim[23] = 90'h35d92297ef7296419bbe190;
    stim[24] = 90'h3bf0f8f08de99114df43b82;
    stim[25] = 90'h06df640877a73fe6db4e398;
    stim[26] = 90'h04aaeb578b19e089f02009c;
    stim[27] = 90'h1e7a0729b463e0379e73230;
    stim[28] = 90'h074ebac898b47ae6c0dc9ee;
    stim[29] = 90'h0e99ae9125f10e13f96652c;
    stim[30] = 90'h0605c6f231185809fbc1a62;
    stim[31] = 90'h39b937e179c649a5e9afab6;
    stim[32] = 90'h3ea81119e81de6d55445ccc;
    stim[33] = 90'h3aae0d14f54d29f671a9ab4;
    stim[34] = 90'h2dd0a77345d228144e1d5bc;
    stim[35] = 90'h10a62d2e09f407a6a26b2ba;
    stim[36] = 90'h285fe5850e4f28529f74020;
    stim[37] = 90'h27fb0b0c275aa676860ce6c;
    stim[38] = 90'h2e79dae963980485be8e454;
    stim[39] = 90'h3cbb963e75bcb583b441c6c;
    stim[40] = 90'h2af854e9a5d888a00c063e4;
    stim[41] = 90'h24152dbd3f483e0cba841d2;
    stim[42] = 90'h3469e5db305401dabc3f458;
    stim[43] = 90'h294bda2bde215fb08d4a43e;
    stim[44] = 90'h0142e51792f2a5794ff7664;
    stim[45] = 90'h13f5bcc213a95ac9a0b531c;
    stim[46] = 90'h09d94f056ddb84a65cd6c04;
    stim[47] = 90'h1264ed3ce956f008c23aaac;
    stim[48] = 90'h0336b7988f09074cf1ca0ba;
    stim[49] = 90'h3bdb0b0a479bfa82c9e2c60;
    stim[50] = 90'h250b0e106349c020def93ea;
    stim[51] = 90'h3e5d9758746d79759a47af0;
    stim[52] = 90'h1d5ed18f3bafc15bb20f32c;
    stim[53] = 90'h1d3dd55a40aac667bf612dc;
    stim[54] = 90'h14139d67410c1b42ac3845c;
    stim[55] = 90'h0abe1932f37834235a613f4;
    stim[56] = 90'h12ab6965ad147270475f2ba;
    stim[57] = 90'h25995834d73d3d33dd9a3ea;
    stim[58] = 90'h14bd62c62eb51fafa6d2f78;
    stim[59] = 90'h1e3502f96d3ecb64f752e14;
    stim[60] = 90'h1272f9832acedf32562ccea;
    stim[61] = 90'h29d66b43a5c1c90adba80ac;
    stim[62] = 90'h3bf8ba0af371473af7053b0;
    stim[63] = 90'h2287ada6f86c880af3ce374;
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
      expv[0] = 68'h00000000000000000;
      expv[1] = 68'h00000000000000000;
      expv[2] = 68'h00000000000000000;
      expv[3] = 68'h00000000000000000;
      expv[4] = 68'h00000000000000000;
      expv[5] = 68'h00000000000000000;
      expv[6] = 68'h00000000000000000;
      expv[7] = 68'h00000000000000000;
      expv[8] = 68'h00000000000000000;
      expv[9] = 68'h00000000000000000;
      expv[10] = 68'h00000000000000000;
      expv[11] = 68'h00000000000000000;
      expv[12] = 68'h00000000000000000;
      expv[13] = 68'h00000000000000000;
      expv[14] = 68'h00000000000000000;
      expv[15] = 68'h00000000000000000;
      expv[16] = 68'h00000000000000000;
      expv[17] = 68'h00000000000000000;
      expv[18] = 68'h00000000000000000;
      expv[19] = 68'h00000000000000000;
      expv[20] = 68'h00000000000000000;
      expv[21] = 68'h00000000000000000;
      expv[22] = 68'h00000000000000000;
      expv[23] = 68'h00000000000000000;
      expv[24] = 68'h00000000000000000;
      expv[25] = 68'h00000000000000000;
      expv[26] = 68'h00000000000000000;
      expv[27] = 68'h00000000000000000;
      expv[28] = 68'h00000000000000000;
      expv[29] = 68'h00000000000000000;
      expv[30] = 68'h00000000000000000;
      expv[31] = 68'h00000000000000000;
      expv[32] = 68'h00000000000000000;
      expv[33] = 68'h00000000000000000;
      expv[34] = 68'h00000000000000000;
      expv[35] = 68'h00000000000000000;
      expv[36] = 68'h00000000000000000;
      expv[37] = 68'h00000000000000000;
      expv[38] = 68'h00000000000000000;
      expv[39] = 68'h00000000000000000;
      expv[40] = 68'h00000000000000000;
      expv[41] = 68'h00000000000000000;
      expv[42] = 68'h00000000000000000;
      expv[43] = 68'h00000000000000000;
      expv[44] = 68'h00000000000000000;
      expv[45] = 68'h00000000000000000;
      expv[46] = 68'h00000000000000000;
      expv[47] = 68'h00000000000000000;
      expv[48] = 68'h00000000000000000;
      expv[49] = 68'h00000000000000000;
      expv[50] = 68'h00000000000000000;
      expv[51] = 68'h00000000000000000;
      expv[52] = 68'h00000000000000000;
      expv[53] = 68'h00000000000000000;
      expv[54] = 68'h00000000000000000;
      expv[55] = 68'h00000000000000000;
      expv[56] = 68'h00000000000000000;
      expv[57] = 68'h00000000000000000;
      expv[58] = 68'h00000000000000000;
      expv[59] = 68'h00000000000000000;
      expv[60] = 68'h00000000000000000;
      expv[61] = 68'h00000000000000000;
      expv[62] = 68'h00000000000000000;
      expv[63] = 68'h00000000000000000;
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

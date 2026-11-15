// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 79;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_078230 dut (
    .clockIn(clk),
    .reset(in_vec[81:81]),
    .stall(in_vec[80:80]),
    .memStall(in_vec[79:79]),
    .haltIn(in_vec[78:78]),
    .regWriteIn(in_vec[77:77]),
    .mem2RegIn(in_vec[76:76]),
    .memWriteIn(in_vec[75:75]),
    .memReadIn(in_vec[74:74]),
    .data1In(in_vec[73:42]),
    .data2In(in_vec[41:10]),
    .regIn(in_vec[9:5]),
    .reg2In(in_vec[4:0]),
    .haltOut(out_vec[78:78]),
    .regWriteOut(out_vec[77:77]),
    .mem2RegOut(out_vec[76:76]),
    .memWriteOut(out_vec[75:75]),
    .memReadOut(out_vec[74:74]),
    .data1Out(out_vec[73:42]),
    .data2Out(out_vec[41:10]),
    .regOut(out_vec[9:5]),
    .reg2Out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h25baedee3d81c91461d68;
    stim[1] = 82'h3e017a410c59ce6359e70;
    stim[2] = 82'h0a19fdad6767f5d809a7b;
    stim[3] = 82'h195e6fb693fe6eb6a85dd;
    stim[4] = 82'h10068df54058e067520f3;
    stim[5] = 82'h0deda5ca7403de6a43fbb;
    stim[6] = 82'h06feb228334ad031f188f;
    stim[7] = 82'h0909d88b6fffebd9a6b02;
    stim[8] = 82'h1d75134a62b205516cee0;
    stim[9] = 82'h0b24aa19a76329fd82fc4;
    stim[10] = 82'h10f22bd9349a5b784a8c9;
    stim[11] = 82'h0cc727683f5706338a26d;
    stim[12] = 82'h1b4252acdbc1a23d0013f;
    stim[13] = 82'h0d67d3fddd94fdcc863b1;
    stim[14] = 82'h1aa51f30163166c268675;
    stim[15] = 82'h0c8b239dcd2973aa1edb5;
    stim[16] = 82'h0a1c80a6dbcb474d65bdd;
    stim[17] = 82'h161a670bee473c939098b;
    stim[18] = 82'h0eea28dd774907ab61926;
    stim[19] = 82'h0ccac2977be2b3d75e8b9;
    stim[20] = 82'h129f1dafd6793a7b3b766;
    stim[21] = 82'h062446650ff630b444496;
    stim[22] = 82'h1daf46b8928487126409f;
    stim[23] = 82'h0465750bf1a36c9419821;
    stim[24] = 82'h1ffc4319d1d1326560c56;
    stim[25] = 82'h1bad07d007768dc7c909e;
    stim[26] = 82'h13921b762de4645180680;
    stim[27] = 82'h0212cd466170873296bae;
    stim[28] = 82'h1149fc1b3f4bcf8cf9eba;
    stim[29] = 82'h0e9846fadacc7f6833df7;
    stim[30] = 82'h014a0c80c2006d2dfd71c;
    stim[31] = 82'h1bd8f0f930ef66c588309;
    stim[32] = 82'h02181c6a78331ff2a2240;
    stim[33] = 82'h0fc02b6bbda54ecd69577;
    stim[34] = 82'h11ae93d1c775fb9757385;
    stim[35] = 82'h19a0fce4b8c229da4067b;
    stim[36] = 82'h17e46b5677dbe395d3a30;
    stim[37] = 82'h18509219f50f115c632c2;
    stim[38] = 82'h16e1be0c6659ffa54cc8b;
    stim[39] = 82'h186ee153589d125865e06;
    stim[40] = 82'h1830af589cf4780ec7b2f;
    stim[41] = 82'h02270574ffe664bf17cfc;
    stim[42] = 82'h1990aa2c73e2db24dbd8f;
    stim[43] = 82'h08fdf202ce80dbe0d4f99;
    stim[44] = 82'h10b826ed4c345fd98eb38;
    stim[45] = 82'h1a275d48bd7230ffb72f6;
    stim[46] = 82'h198b12523bfc3bc321609;
    stim[47] = 82'h170e9e5b59cd7c9bba496;
    stim[48] = 82'h12fac69e3ff1f647bef37;
    stim[49] = 82'h0c4681c95d7603499dad3;
    stim[50] = 82'h1a74cfcf3c07002277111;
    stim[51] = 82'h0b726d65c82ef24bd06a5;
    stim[52] = 82'h1fc4b68bcb9531f0cacd0;
    stim[53] = 82'h0228c881ae125297f932b;
    stim[54] = 82'h0c43470f95f4356d84f8e;
    stim[55] = 82'h10da056b445e5857c7c45;
    stim[56] = 82'h0589a93a089f143d86aa9;
    stim[57] = 82'h03320bf1f095344e5c0d2;
    stim[58] = 82'h192ab541fc61e9bc55da1;
    stim[59] = 82'h0e69f6e660237878b19a0;
    stim[60] = 82'h0c13631848a62c329f95a;
    stim[61] = 82'h136c90018b97946c14139;
    stim[62] = 82'h17d05e36476e9b12437b7;
    stim[63] = 82'h0bbae175c8460f1c298ad;
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
      expv[0] = 79'h00000000000000000000;
      expv[1] = 79'h00000000000000000000;
      expv[2] = 79'h00000000000000000000;
      expv[3] = 79'h00000000000000000000;
      expv[4] = 79'h00000000000000000000;
      expv[5] = 79'h00000000000000000000;
      expv[6] = 79'h00000000000000000000;
      expv[7] = 79'h6feb228334ad031f188f;
      expv[8] = 79'h6feb228334ad031f188f;
      expv[9] = 79'h6feb228334ad031f188f;
      expv[10] = 79'h6feb228334ad031f188f;
      expv[11] = 79'h6feb228334ad031f188f;
      expv[12] = 79'h6feb228334ad031f188f;
      expv[13] = 79'h6feb228334ad031f188f;
      expv[14] = 79'h6feb228334ad031f188f;
      expv[15] = 79'h6feb228334ad031f188f;
      expv[16] = 79'h6feb228334ad031f188f;
      expv[17] = 79'h6feb228334ad031f188f;
      expv[18] = 79'h6feb228334ad031f188f;
      expv[19] = 79'h6feb228334ad031f188f;
      expv[20] = 79'h6feb228334ad031f188f;
      expv[21] = 79'h6feb228334ad031f188f;
      expv[22] = 79'h62446650ff630b444496;
      expv[23] = 79'h62446650ff630b444496;
      expv[24] = 79'h465750bf1a36c9419821;
      expv[25] = 79'h465750bf1a36c9419821;
      expv[26] = 79'h465750bf1a36c9419821;
      expv[27] = 79'h465750bf1a36c9419821;
      expv[28] = 79'h212cd466170873296bae;
      expv[29] = 79'h212cd466170873296bae;
      expv[30] = 79'h212cd466170873296bae;
      expv[31] = 79'h14a0c80c2006d2dfd71c;
      expv[32] = 79'h14a0c80c2006d2dfd71c;
      expv[33] = 79'h2181c6a78331ff2a2240;
      expv[34] = 79'h2181c6a78331ff2a2240;
      expv[35] = 79'h2181c6a78331ff2a2240;
      expv[36] = 79'h2181c6a78331ff2a2240;
      expv[37] = 79'h2181c6a78331ff2a2240;
      expv[38] = 79'h2181c6a78331ff2a2240;
      expv[39] = 79'h2181c6a78331ff2a2240;
      expv[40] = 79'h2181c6a78331ff2a2240;
      expv[41] = 79'h2181c6a78331ff2a2240;
      expv[42] = 79'h2270574ffe664bf17cfc;
      expv[43] = 79'h2270574ffe664bf17cfc;
      expv[44] = 79'h2270574ffe664bf17cfc;
      expv[45] = 79'h2270574ffe664bf17cfc;
      expv[46] = 79'h2270574ffe664bf17cfc;
      expv[47] = 79'h2270574ffe664bf17cfc;
      expv[48] = 79'h2270574ffe664bf17cfc;
      expv[49] = 79'h2270574ffe664bf17cfc;
      expv[50] = 79'h2270574ffe664bf17cfc;
      expv[51] = 79'h2270574ffe664bf17cfc;
      expv[52] = 79'h2270574ffe664bf17cfc;
      expv[53] = 79'h2270574ffe664bf17cfc;
      expv[54] = 79'h228c881ae125297f932b;
      expv[55] = 79'h228c881ae125297f932b;
      expv[56] = 79'h228c881ae125297f932b;
      expv[57] = 79'h589a93a089f143d86aa9;
      expv[58] = 79'h3320bf1f095344e5c0d2;
      expv[59] = 79'h3320bf1f095344e5c0d2;
      expv[60] = 79'h3320bf1f095344e5c0d2;
      expv[61] = 79'h3320bf1f095344e5c0d2;
      expv[62] = 79'h3320bf1f095344e5c0d2;
      expv[63] = 79'h3320bf1f095344e5c0d2;
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

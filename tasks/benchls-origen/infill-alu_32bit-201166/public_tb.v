// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_201166 dut (
    .a(in_vec[67:36]),
    .b(in_vec[35:4]),
    .aluc(in_vec[3:0]),
    .r(out_vec[35:4]),
    .zero(out_vec[3:3]),
    .carry(out_vec[2:2]),
    .negative(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hec7f32ca8eb8fc672;
    stim[1] = 68'h32e668f488c4ab2dc;
    stim[2] = 68'h3f2d8243d590a12d6;
    stim[3] = 68'hf3051630aad6184e4;
    stim[4] = 68'h751c0e69a9a7c88d8;
    stim[5] = 68'hbf12597b39a5033ea;
    stim[6] = 68'h2edd202caa1989067;
    stim[7] = 68'hc53addab63152b884;
    stim[8] = 68'h57d5fc13a9aa828d2;
    stim[9] = 68'h81bebb07917650f28;
    stim[10] = 68'h9abc7877b246d9189;
    stim[11] = 68'h45b7ba645f94eb0cd;
    stim[12] = 68'h66c05f613ca0d4a64;
    stim[13] = 68'ha936b4a9b2b1bf7cd;
    stim[14] = 68'h50a0092fe213840c9;
    stim[15] = 68'hc4f7d92497053d003;
    stim[16] = 68'h47412cf089f7a4ce4;
    stim[17] = 68'h27955d0df48b051d2;
    stim[18] = 68'h7d2fa24986c4afd3c;
    stim[19] = 68'h40a2715fabde4fc99;
    stim[20] = 68'h1964823c16c573047;
    stim[21] = 68'hddbca5edd15d373fa;
    stim[22] = 68'hec1a091764f33a926;
    stim[23] = 68'h12708a2c869276b44;
    stim[24] = 68'hceac8002ef1f97f95;
    stim[25] = 68'he529366bd6a3eec43;
    stim[26] = 68'hb03789be72374227f;
    stim[27] = 68'hb7ce37a4eaab22671;
    stim[28] = 68'h81e49daedcd98fbae;
    stim[29] = 68'hb01d62b3d223fee7b;
    stim[30] = 68'hf9cbffc0cdc6aa48b;
    stim[31] = 68'h1c6cf16b4e0e19a20;
    stim[32] = 68'h63fc2f0ecd0f0f11e;
    stim[33] = 68'h691dbfc2b269642f8;
    stim[34] = 68'h66f5fc4991e1e506c;
    stim[35] = 68'he4baec42123fbe3b4;
    stim[36] = 68'hfc2f68d5b54962e10;
    stim[37] = 68'h1b1840ded276a3eaf;
    stim[38] = 68'hb5f9edef0be963974;
    stim[39] = 68'h4818350866d4ba212;
    stim[40] = 68'h8a43f6fec26c90035;
    stim[41] = 68'h1ba9c9622324498d3;
    stim[42] = 68'hc39d85f3d5ce657c2;
    stim[43] = 68'h217d7366f82bf451e;
    stim[44] = 68'h9ac2725043f1f596a;
    stim[45] = 68'h8d552ff07fbbf162b;
    stim[46] = 68'hd0dbf624e210b6f51;
    stim[47] = 68'h7633b0fd5506fed0b;
    stim[48] = 68'h43f5943416302e655;
    stim[49] = 68'h2d02984a526477ebe;
    stim[50] = 68'h79e4f0aebe96d28b0;
    stim[51] = 68'h520a81d63620e8984;
    stim[52] = 68'ha9f0bb22ff9e2ae14;
    stim[53] = 68'h08527f75fa601b76c;
    stim[54] = 68'h2b4c2499f79d58415;
    stim[55] = 68'ha24de51b1909171ef;
    stim[56] = 68'h1392a0d96baa62629;
    stim[57] = 68'ha706df2b640b34a66;
    stim[58] = 68'h42b73917a60e83de1;
    stim[59] = 68'he8fde14682f7bf433;
    stim[60] = 68'hd2263773983a36990;
    stim[61] = 68'h72c01bc28763c83f2;
    stim[62] = 68'hea677381c8395460c;
    stim[63] = 68'h7a93f389498d82d29;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 36'h5dc636630;
      expv[1] = 36'hb2d000002;
      expv[2] = 36'heabd236e2;
      expv[3] = 36'ha20410002;
      expv[4] = 36'hc88d00002;
      expv[5] = 36'h000000008;
      expv[6] = 36'h512256d10;
      expv[7] = 36'h411009880;
      expv[8] = 36'hae2b79866;
      expv[9] = 36'h50f200000;
      expv[10] = 36'h000000010;
      expv[11] = 36'h05f94eb00;
      expv[12] = 36'h248054200;
      expv[13] = 36'h005958df0;
      expv[14] = 36'h000000008;
      expv[15] = 36'h2df29c240;
      expv[16] = 36'h014124c00;
      expv[17] = 36'h330a57f04;
      expv[18] = 36'h895fa6002;
      expv[19] = 36'h000000008;
      expv[20] = 36'he01a0cc32;
      expv[21] = 36'h000000008;
      expv[22] = 36'h88e933852;
      expv[23] = 36'h021002240;
      expv[24] = 36'hefbf97fb2;
      expv[25] = 36'h0e8547a70;
      expv[26] = 36'h000000008;
      expv[27] = 36'ha2795a0b6;
      expv[28] = 36'h000000008;
      expv[29] = 36'hfffffa442;
      expv[30] = 36'hcdc6aa482;
      expv[31] = 36'h6a7b0b0d0;
      expv[32] = 36'h000000008;
      expv[33] = 36'h642f00000;
      expv[34] = 36'hc3ca0c002;
      expv[35] = 36'h003aac020;
      expv[36] = 36'hb178cbb66;
      expv[37] = 36'h000000008;
      expv[38] = 36'h01e961870;
      expv[39] = 36'he1437ae76;
      expv[40] = 36'hca6ff6ff2;
      expv[41] = 36'hf8857fd56;
      expv[42] = 36'hedcf20776;
      expv[43] = 36'h000000008;
      expv[44] = 36'h000000008;
      expv[45] = 36'h00007fbb0;
      expv[46] = 36'hb2ecad196;
      expv[47] = 36'h000000020;
      expv[48] = 36'h57f5be750;
      expv[49] = 36'h000000008;
      expv[50] = 36'h387bc3394;
      expv[51] = 36'h120080900;
      expv[52] = 36'ha9902a202;
      expv[53] = 36'h6ec000000;
      expv[54] = 36'hffdd7cd92;
      expv[55] = 36'h000000008;
      expv[56] = 36'h000000010;
      expv[57] = 36'hc30deb8d2;
      expv[58] = 36'he8c5bcf52;
      expv[59] = 36'h660622030;
      expv[60] = 36'h6a606e0c4;
      expv[61] = 36'heb5c53836;
      expv[62] = 36'h9072a8c02;
      expv[63] = 36'h000000008;
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

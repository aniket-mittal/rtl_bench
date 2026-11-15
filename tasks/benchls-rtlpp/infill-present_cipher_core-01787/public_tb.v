// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01787 dut (
    .clk_i(clk),
    .data_i(in_vec[81:2]),
    .data_load(in_vec[1:1]),
    .key_load(in_vec[0:0]),
    .data_o(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h387352f349e6712924f7c;
    stim[1] = 82'h1e22c7bb035c1cd78a215;
    stim[2] = 82'h2c047bbfabb16b6c782a3;
    stim[3] = 82'h29c8d6e0106dcb7bd20de;
    stim[4] = 82'h38830a7f3ac87adbab6ac;
    stim[5] = 82'h16376c98434bafd5c2358;
    stim[6] = 82'h30c27e620b128b48ecc5e;
    stim[7] = 82'h237a7b2df802388f782d3;
    stim[8] = 82'h17cb2fc75da28f39ea0db;
    stim[9] = 82'h1223bb940e0a43ce71068;
    stim[10] = 82'h0f1d4fa92fefa99852c48;
    stim[11] = 82'h2daca376b02dd2c17283f;
    stim[12] = 82'h0a162a922e20c9718d352;
    stim[13] = 82'h2578b031a74e15d90971f;
    stim[14] = 82'h2364463576d78efc5202e;
    stim[15] = 82'h289c65d1f0e1913bbd949;
    stim[16] = 82'h104905b17cd346bce68ba;
    stim[17] = 82'h023434b6c5b8c6aa93be9;
    stim[18] = 82'h3d79812e5815c6e355b87;
    stim[19] = 82'h2c6766d4716f2d698e76e;
    stim[20] = 82'h305544c45619ec1204c8d;
    stim[21] = 82'h36ac6f54099e2a10bc122;
    stim[22] = 82'h20b9c6b50ea9528544d47;
    stim[23] = 82'h1baab3fb7dd3eab58225f;
    stim[24] = 82'h3aee71d33a9e2a891ed7a;
    stim[25] = 82'h21708ac0458e034f80647;
    stim[26] = 82'h2e46b84219cd6557dd7bb;
    stim[27] = 82'h323028edf27dff825ea26;
    stim[28] = 82'h192e50a60a8e4b8851aac;
    stim[29] = 82'h0dee862cb8c95581f148a;
    stim[30] = 82'h04b7c42c8d636a6f01c9d;
    stim[31] = 82'h2f4bab91e460eeac8f1bf;
    stim[32] = 82'h0102e2fbe4e369d60e09e;
    stim[33] = 82'h387fe05bbfb29e3e2e6f4;
    stim[34] = 82'h324d71e5bc05cd080cdb9;
    stim[35] = 82'h0a1fd21aa6cd4ddd4d51b;
    stim[36] = 82'h17b23bf8979e39fdf9a1a;
    stim[37] = 82'h1d4a03915abbae81e46de;
    stim[38] = 82'h39f3b3dae73a9f9edd4aa;
    stim[39] = 82'h0856d9b904d249fd25283;
    stim[40] = 82'h3845015ab39a490663444;
    stim[41] = 82'h2fa34200557ae6de9516c;
    stim[42] = 82'h244e70e6f4f48a5c65501;
    stim[43] = 82'h000f0d84de6ace8f840b3;
    stim[44] = 82'h208046e4846d7d6273b47;
    stim[45] = 82'h14b7dfa7718a813643b01;
    stim[46] = 82'h35c900eab357f078de5b0;
    stim[47] = 82'h211f61eb4ac023f5a81c1;
    stim[48] = 82'h11ba62444d9cceba1da25;
    stim[49] = 82'h099788d4f32babec2899e;
    stim[50] = 82'h24be49425d7280f0a1694;
    stim[51] = 82'h0c7a2f710a6992106d801;
    stim[52] = 82'h0f47bd78a493f862b1b32;
    stim[53] = 82'h072fa8655a66ed722bfb2;
    stim[54] = 82'h0c6e00b20f36edc642433;
    stim[55] = 82'h0aa77380da67abe063787;
    stim[56] = 82'h16b6e09f745fee27c872f;
    stim[57] = 82'h3465308125ee08d9a5ac6;
    stim[58] = 82'h1bf132b2de5946ddb329d;
    stim[59] = 82'h2e0127fbecfcb02f20137;
    stim[60] = 82'h3da47d0daeedf7f3b0668;
    stim[61] = 82'h01690a9b958e15985fbc9;
    stim[62] = 82'h327486edc7d80990570de;
    stim[63] = 82'h12c0f02803cc4044e6cb8;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'heb91af49832ae586;
      expv[5] = 64'hc784b94bbef5305e;
      expv[6] = 64'hf1327cc91c3577e5;
      expv[7] = 64'hcf3ee9c88fe3f4ac;
      expv[8] = 64'h7461c0fdcd2b512a;
      expv[9] = 64'ha6a493575ba98ff0;
      expv[10] = 64'h43a258b2cc4a2121;
      expv[11] = 64'h4b51c412153693dd;
      expv[12] = 64'hf510d5680cfd6a24;
      expv[13] = 64'h1cfa3559e5717fd1;
      expv[14] = 64'h3faa7845b8fe63b0;
      expv[15] = 64'h8d371b98a6c91f6f;
      expv[16] = 64'hbaa44c19f8770ce5;
      expv[17] = 64'hb4b4640ad975dec0;
      expv[18] = 64'h1e1521960c108084;
      expv[19] = 64'he323f7f47aa481a3;
      expv[20] = 64'h6eb7c105d5f12256;
      expv[21] = 64'h5a04d6adedc18993;
      expv[22] = 64'h7c053569f0254000;
      expv[23] = 64'h3fb73cac92e7ba5d;
      expv[24] = 64'hd3fae9955f0d5a9e;
      expv[25] = 64'ha9e625955d6bd188;
      expv[26] = 64'h428ec179bc1c7660;
      expv[27] = 64'h7e560b70cd11ee01;
      expv[28] = 64'h1aad28ff993cefd6;
      expv[29] = 64'he410ffdcc51de330;
      expv[30] = 64'he60f34060a26c9c4;
      expv[31] = 64'h0a6df397638a6c9e;
      expv[32] = 64'ha59c4d62c7847f90;
      expv[33] = 64'h36c13dca36db8295;
      expv[34] = 64'h614cca6fe31370a5;
      expv[35] = 64'hfff4fa5cc6ccb6b5;
      expv[36] = 64'h1ebe75a0adeeb5e0;
      expv[37] = 64'hc79d16127cc2d1f3;
      expv[38] = 64'h263a22842132a6c2;
      expv[39] = 64'he714d480e54e425f;
      expv[40] = 64'hee30fa0e6d3252de;
      expv[41] = 64'h6ca4fe2501eed0b7;
      expv[42] = 64'h683b2e77816bbd2c;
      expv[43] = 64'hfd9d3dbed23cf9c6;
      expv[44] = 64'h6c98c8367845ea89;
      expv[45] = 64'heea5e5b7105b253e;
      expv[46] = 64'h3e7b80b8c7c4d46e;
      expv[47] = 64'h2fa38ae328176cab;
      expv[48] = 64'hba060715ecc45bb8;
      expv[49] = 64'h789209a9f1b7ee86;
      expv[50] = 64'h65ba45bf99c3988f;
      expv[51] = 64'h7b6b6d62a8e1be41;
      expv[52] = 64'h5452f87bb065d0ce;
      expv[53] = 64'hc40a2f8bc82c8e8d;
      expv[54] = 64'h907dd45f9c6ee7ad;
      expv[55] = 64'h902d6b53891318f5;
      expv[56] = 64'h8b08a798dc56006d;
      expv[57] = 64'hfb4eebe664b71773;
      expv[58] = 64'h98df15c5f2192e2e;
      expv[59] = 64'hadc05d735a038dc7;
      expv[60] = 64'h7a0008579094560d;
      expv[61] = 64'hfa09bf570369a073;
      expv[62] = 64'h7fa42239c6ac006c;
      expv[63] = 64'h1e13350e70790a56;
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

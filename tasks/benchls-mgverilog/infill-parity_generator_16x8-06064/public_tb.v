// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06064 dut (
    .data_in(in_vec[127:0]),
    .parity_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h366305f0c6b5ba701ef67144ad88c386;
    stim[1] = 128'h4fe5a9e9d09f7746c716050200b978ab;
    stim[2] = 128'h615e8df9b9e4a15a59536ecdbe24165d;
    stim[3] = 128'h0981fea98da7b01b27444dfd55833e4d;
    stim[4] = 128'h8776973382eeb3beb7c34e91a4d0d2c2;
    stim[5] = 128'h50afa5a4bce4bb2216392fed7da01bb9;
    stim[6] = 128'h23c5dd67b0773a46cc85af93820d2ac4;
    stim[7] = 128'hd2d9c9195f9ca718d712ef2624d2f0ff;
    stim[8] = 128'h24baeff18fde82c27e6b420e6e7963a0;
    stim[9] = 128'hf8cf46e02cbcdfee6637bd5002bccf01;
    stim[10] = 128'hedc55fc58361d81eb487536717b90062;
    stim[11] = 128'hf5000abde87b259fe328840f1808f8f6;
    stim[12] = 128'h8338efc1416fa674e2e0e7623041bd79;
    stim[13] = 128'he2d0a13686943ee66f4456e429170019;
    stim[14] = 128'h5c108e2a49d67533e2009a791c96106d;
    stim[15] = 128'h3c2b77d0e1f55fc464e63060450431d6;
    stim[16] = 128'h63374337cf79f1a1a5d9f2ca2b965dc1;
    stim[17] = 128'h9841390f734f13987c7e81e0fc840c09;
    stim[18] = 128'h9ae6fa21ccf523b95225cbce1996e570;
    stim[19] = 128'hb935a170a36a0aa9631330e5db0a6ff8;
    stim[20] = 128'h3f164006ef65a32fb7d0d9e05a9e5605;
    stim[21] = 128'h8554d93b0605ae71e6f3ad39a440d588;
    stim[22] = 128'haa7fc373196b20999e38b6daab0293f8;
    stim[23] = 128'heb9056423e0ecef7c0485c0227069fae;
    stim[24] = 128'h433a65b743bc02746bc8a6c3192fd0c3;
    stim[25] = 128'h8a24ab4f52b22a966d28492221d3c9ab;
    stim[26] = 128'h2b1b660593e265045aa5c6213972bd36;
    stim[27] = 128'hec6cab8a56b2da2cbbaaa961e0127cc3;
    stim[28] = 128'h8b14758536fed2e881020f81162c8e42;
    stim[29] = 128'hee1a0b1411dc15add600535433c3e8b9;
    stim[30] = 128'hc83dea1c237fbd6d0e7c11678f8ddbf4;
    stim[31] = 128'h8c462ca903f471dedab43c0dac5257fb;
    stim[32] = 128'h9d08705118a344db79b4b92e7204c9c5;
    stim[33] = 128'h918ce94bfe92916215243ff1ea2aea5b;
    stim[34] = 128'he36ce883aa6aa779e77f1acd8d8873a8;
    stim[35] = 128'h14ca7a54b328d02ccc5f946c9c6ea104;
    stim[36] = 128'h946e231f4b4c2963ed3612bc55a32b24;
    stim[37] = 128'h7be0c408a7cf128d3e8814183914bb60;
    stim[38] = 128'h9664fa27b3d17189871712fe3c3feb18;
    stim[39] = 128'hf4424f07d679141b0a4fd01fd8568e5e;
    stim[40] = 128'ha292993482df4a91fc9d7c9336db1065;
    stim[41] = 128'h0ac3eb16d066ab62ae013b3a5471eca9;
    stim[42] = 128'h3c077363b7630d1d5f73f189f83178c2;
    stim[43] = 128'hc09f9698d9e1ef72a7df83b98df5b6a7;
    stim[44] = 128'ha98317bb7b430add8a7d5aad10728a14;
    stim[45] = 128'h3f97b864c1dacb3e159ccb664c6cd5f5;
    stim[46] = 128'hd57efec48d4b8550de803af9d12eeed1;
    stim[47] = 128'h098c89f5b428c75a13cc76d95b86251c;
    stim[48] = 128'ha188032483db8925d1682035bf12776f;
    stim[49] = 128'h7b5fcfd7f94ef3e0791ec3fc5aa6e8a9;
    stim[50] = 128'hd04b510d5b80de29dd076058d3446337;
    stim[51] = 128'h309567e666d73fb077238e3777278443;
    stim[52] = 128'h05ef1166ddc942f547ecfdc4638c3a4c;
    stim[53] = 128'h6bb210f585773cfbc89859cb99c9e2cb;
    stim[54] = 128'h32aa215728f749881e17d8a622b02051;
    stim[55] = 128'hfb5a6a2b28bfd5873640b38e1aef8377;
    stim[56] = 128'hb57f83f7259234e77512eeb68f2f734e;
    stim[57] = 128'hf76caea21447ad3737a2efb3deaa709a;
    stim[58] = 128'h6dba749eb7af7dcb051eaa5f954c5c7d;
    stim[59] = 128'h822aa5546628ba31e54b2fe0d7d88f94;
    stim[60] = 128'hbcfb86c7c7c091172a99768b2f9a9bdf;
    stim[61] = 128'h6eb21f47cfc956d248af5650500e6cfa;
    stim[62] = 128'ha6650837dd36a64f7f2c58f19b5312e6;
    stim[63] = 128'h6a09daaca79df01cdbdf01cfd455156c;
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
      expv[0] = 16'h0709;
      expv[1] = 16'hd9d5;
      expv[2] = 16'hca33;
      expv[3] = 16'h2616;
      expv[4] = 16'h621d;
      expv[5] = 16'h18a1;
      expv[6] = 16'h9947;
      expv[7] = 16'h5230;
      expv[8] = 16'h795c;
      expv[9] = 16'hbe4d;
      expv[10] = 16'h0c15;
      expv[11] = 16'h0286;
      expv[12] = 16'hf051;
      expv[13] = 16'h6f09;
      expv[14] = 16'h5e1b;
      expv[15] = 16'h11cf;
      expv[16] = 16'h7763;
      expv[17] = 16'h8f90;
      expv[18] = 16'h43fb;
      expv[19] = 16'hb051;
      expv[20] = 16'h6974;
      expv[21] = 16'hf2ae;
      expv[22] = 16'h5efd;
      expv[23] = 16'h0f11;
      expv[24] = 16'h8ece;
      expv[25] = 16'hbaa5;
      expv[26] = 16'h0100;
      expv[27] = 16'hb31a;
      expv[28] = 16'h344c;
      expv[29] = 16'h6791;
      expv[30] = 16'hfdd9;
      expv[31] = 16'he497;
      expv[32] = 16'hf0a4;
      expv[33] = 16'hef9f;
      expv[34] = 16'h9373;
      expv[35] = 16'h3b27;
      expv[36] = 16'hf610;
      expv[37] = 16'h7880;
      expv[38] = 16'h4910;
      expv[39] = 16'hbc71;
      expv[40] = 16'hd762;
      expv[41] = 16'h1bea;
      expv[42] = 16'h627d;
      expv[43] = 16'h1af3;
      expv[44] = 16'h449a;
      expv[45] = 16'h5faa;
      expv[46] = 16'hb240;
      expv[47] = 16'h62bf;
      expv[48] = 16'h8b68;
      expv[49] = 16'h0180;
      expv[50] = 16'hbd59;
      expv[51] = 16'h3151;
      expv[52] = 16'h4075;
      expv[53] = 16'ha9d1;
      expv[54] = 16'h9607;
      expv[55] = 16'h866e;
      expv[56] = 16'hfe9e;
      expv[57] = 16'hb3f2;
      expv[58] = 16'hd104;
      expv[59] = 16'h53b3;
      expv[60] = 16'hfaab;
      expv[61] = 16'ha004;
      expv[62] = 16'h31f9;
      expv[63] = 16'h2d62;
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

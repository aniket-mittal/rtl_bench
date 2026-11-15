// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087725 dut (
    .top_left(in_vec[63:56]),
    .top(in_vec[55:24]),
    .left(in_vec[23:0]),
    .dst(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h92aba92fd7a3f4cc;
    stim[1] = 64'h68c88963c0e55627;
    stim[2] = 64'h9ebc64daef63674b;
    stim[3] = 64'he54859ef3359ae0f;
    stim[4] = 64'h2859ed54e26d80fc;
    stim[5] = 64'hec4f3cb024ab9ad0;
    stim[6] = 64'h2d63dfe9e0f38706;
    stim[7] = 64'h56f1cbea924fc033;
    stim[8] = 64'hcf9c2cc34653c708;
    stim[9] = 64'ha791f792e619df65;
    stim[10] = 64'hd08c0f0ca20549cc;
    stim[11] = 64'h8dda24e7666d6ac5;
    stim[12] = 64'hbdd287230ed0e169;
    stim[13] = 64'hb0ce8df7f605851a;
    stim[14] = 64'h44edccb415a6ef3f;
    stim[15] = 64'hb18ed7ce358d8d0c;
    stim[16] = 64'hdb019cb06742a1d9;
    stim[17] = 64'h9a9f28685e0c0ef4;
    stim[18] = 64'h2da9f4523ed222b3;
    stim[19] = 64'h763c05a62efcd4c4;
    stim[20] = 64'h439cca35c66d2fd9;
    stim[21] = 64'h964b65c9943982fa;
    stim[22] = 64'h6ae7543a0aba521a;
    stim[23] = 64'h648b9c72124295a5;
    stim[24] = 64'he1f3adff0ceed23d;
    stim[25] = 64'h392781d3e185f954;
    stim[26] = 64'h07395d3347bd1b4b;
    stim[27] = 64'h00230df4c22604ae;
    stim[28] = 64'hccc9213ada01334f;
    stim[29] = 64'h17fab641645d7804;
    stim[30] = 64'h19ee657664c54cfc;
    stim[31] = 64'hc74a13192c9b2f3a;
    stim[32] = 64'hd5a41342e40df10b;
    stim[33] = 64'h4ad533dd8fa70d00;
    stim[34] = 64'h50780924fa041189;
    stim[35] = 64'h79368ba1d5ca4be0;
    stim[36] = 64'h5fee058595f77ffe;
    stim[37] = 64'hd617ec3515de893f;
    stim[38] = 64'h0e246e3e86fb2046;
    stim[39] = 64'heed87a1f22b36501;
    stim[40] = 64'hda4203a9ad1805be;
    stim[41] = 64'h5f24381a6dcaf2b0;
    stim[42] = 64'h6d25bc5b7fe82d72;
    stim[43] = 64'h091a8190b9bf91be;
    stim[44] = 64'h32217a2eb59e8f4d;
    stim[45] = 64'hb6fd2f9a5e865517;
    stim[46] = 64'h49a85ba8d2e3a186;
    stim[47] = 64'h55dc4b92589b08c4;
    stim[48] = 64'h827913bd6cb0f208;
    stim[49] = 64'h5d13c6537b3727e2;
    stim[50] = 64'h8fa28b097ab4f97e;
    stim[51] = 64'h867a3da70e9e7896;
    stim[52] = 64'h0b5c67b3856fb7bf;
    stim[53] = 64'h538833bd264c6bb6;
    stim[54] = 64'hc36d30b70194c14d;
    stim[55] = 64'hfef80250221bf775;
    stim[56] = 64'h8ef5757bec76824d;
    stim[57] = 64'hab50b3166c21bbfb;
    stim[58] = 64'h955c9a88d816aabe;
    stim[59] = 64'he6a78431bbcfa6df;
    stim[60] = 64'h828817744fe7ead9;
    stim[61] = 64'ha6a35f9fb8704c62;
    stim[62] = 64'h0b222559a38a49df;
    stim[63] = 64'h29406b297b902be7;
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
      expv[0] = 128'h789cb2d6aa6c83c88b789cb2abaa6c83;
      expv[1] = 128'h84936e6ea97692438f84936ec8a97692;
      expv[2] = 128'hc2d69e5f909fe56798c2d69ebc909fe5;
      expv[3] = 128'h9b8f837151a4916c7a9b8f834851a491;
      expv[4] = 128'h9e908c9aa3a19ba8a29e908c59a3a19b;
      expv[5] = 128'h7079b3ac46766aca5e7079b34f46766a;
      expv[6] = 128'he4b65082a1e4e530c3e4b65063a1e4e5;
      expv[7] = 128'hcc995c81dedbbe5fdccc995cf1dedbbe;
      expv[8] = 128'h7e887b7a6478856a6e7e887b9c647885;
      expv[9] = 128'hc0c1a68fc4c5bc94c4c0c1a691c4c5bc;
      expv[10] = 128'h3288c4594e0e57ac2e3288c48c4e0e57;
      expv[11] = 128'h969091827f86a7a082969091da7f86a7;
      expv[12] = 128'h373f7cbfad55199c81373f7cd2ad5519;
      expv[13] = 128'hdce59c4aaec2f75ab8dce59cceaec2f7;
      expv[14] = 128'h924937b1ddc0656cce924937edddc065;
      expv[15] = 128'haa7a696db3d38256c3aa7a698eb3d382;
      expv[16] = 128'h9996be974fa68ccc7a9996be014fa68c;
      expv[17] = 128'h5670a247644863a4565670a29f644863;
      expv[18] = 128'h763f5372cfa3486db9763f53a9cfa348;
      expv[19] = 128'h605e78da21566ab53b605e783c21566a;
      expv[20] = 128'h7f818969b3807e89997f81899cb3807e;
      expv[21] = 128'ha3a2af8e5897afc378a3a2af4b5897af;
      expv[22] = 128'h352e3e5e9e47223c72352e3ee79e4722;
      expv[23] = 128'h653f6084948742918d653f608b948742;
      expv[24] = 128'hae7e83b4d0d6868bd3ae7e83f3d0d686;
      expv[25] = 128'hc2b46ab354aada777fc2b46a2754aada;
      expv[26] = 128'h433228504b483d2e4a433228394b483d;
      expv[27] = 128'hae9e5c371881db584cae9e5c231881db;
      expv[28] = 128'h5cafb02e752e8a67515cafb0c9752e8a;
      expv[29] = 128'h67482654d87c5326aa674826fad87c53;
      expv[30] = 128'h6d566596aa6e6d978c6d5665eeaa6e6d;
      expv[31] = 128'h1c4e7d4d2f16235b221c4e7d4a2f1623;
      expv[32] = 128'h5fb8a67f5c2b9377435fb8a6a45c2b93;
      expv[33] = 128'h9f9149308488b616869f9149d58488b6;
      expv[34] = 128'h539a892c41178f5d2c539a897841178f;
      expv[35] = 128'ha9b1aa906196bba17ba9b1aa366196bb;
      expv[36] = 128'h698494bd7a458db75f698494ee7a458d;
      expv[37] = 128'h5b4d808c82912577895b4d8017829125;
      expv[38] = 128'h5c563a604956622f505c563a24495662;
      expv[39] = 128'h37548060a94d21557b375480d8a94d21;
      expv[40] = 128'h81b7c8382356ab973c81b7c8422356ab;
      expv[41] = 128'h365577d82e2944ac2c365577242e2944;
      expv[42] = 128'h7c72736d718c6d607e7c727325718c6d;
      expv[43] = 128'h978362a84e89a5866b9783621a4e89a5;
      expv[44] = 128'h63735a824e5472575163735a214e5472;
      expv[45] = 128'h7083785296657c4e7d708378fd96657c;
      expv[46] = 128'h9fa57bab8282bd7e829fa57ba88282bd;
      expv[47] = 128'h7266725c946f757981726672dc946f75;
      expv[48] = 128'h7e865ea746689561577e865e79466895;
      expv[49] = 128'h7a6a865a6d8d67927d7a6a86136d8d67;
      expv[50] = 128'h466386c9974a42a170466386a2974a42;
      expv[51] = 128'h66526c895c725b8b6766526c7a5c725b;
      expv[52] = 128'h957257a7628d9c90779572575c628d9c;
      expv[53] = 128'h755761765e78728b6b755761885e7872;
      expv[54] = 128'h685f75994f745c8861685f756d4f745c;
      expv[55] = 128'h3165a5a07d2939b8533165a5f87d2939;
      expv[56] = 128'h96b89572b578b46b9796b895f5b578b4;
      expv[57] = 128'h5366afa5826541d7735366af50826541;
      expv[58] = 128'ha1b3b08a7b91b0af86a1b3b05c7b91b0;
      expv[59] = 128'h68a3dabf965b76d37868a3daa7965b76;
      expv[60] = 128'h54658be5504662c84b54658b88504662;
      expv[61] = 128'h95ad9a5b817fac6e8095ad9aa3817fac;
      expv[62] = 128'h5f6b667f243f7e85315f6b6622243f7e;
      expv[63] = 128'h4e526d73564a5289504e526d40564a52;
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

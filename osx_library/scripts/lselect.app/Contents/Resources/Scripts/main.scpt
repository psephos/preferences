FasdUAS 1.101.10   ��   ��    k             l      �� ��   [U
	lselect 1.1 by Jim DeVona
	http://anoved.net/lselect.html
	1.0: 1 November 2006
	1.1: 18 December 2006 (somewhat improved Column view behavior)
		
	Select files in the current Finder folder using shell glob syntax.
	When invoked, the user will be prompted to supply a glob pattern.
	The "ls" command line utility is used to determine which files match
	the pattern, and then they are selected.
	
	Suggested installation location:
		~/Library/Scripts/Applications/Finder/lselect.scpt
	
	The script can be invoked with the standard Mac OS X Script Menu,
	but I've found FastScripts (http://www.red-sweater.com/fastscripts/)
	to be a preferable alternative, primarily because of the ease with 
	which reliable keyboard bindings can be assigned. I use Command-G.
	
	Issues:
		- If the last match is a directory and the current view type is
		  Column, other matches will not end up selected (they appear
		  to lose selection when the Finder come to rest on and reveals the
		  contents of the last directory). I don't know how to prevent this.
		- Spaces must be escaped to match properly: "iTunes\ Music"
		- Performance is poor with hundreds of matches; see notes below
	
	Wishes:
		- Select sub-matches within current selection
		- Select matches on desktop instead of in "Desktop" window
		- Support patterns like "../" (subfolder patterns work, but not parent)
       	  l     ������  ��   	  
  
 i         I     ������
�� .aevtoappnull  �   � ****��  ��    O    �    k   �       l   ������  ��        l    �� ��   
		Determine the present working directory as alias and POSIX path.
		If the insertion location is not a folder, use its parent. This is the
		case when a file is selected in Column view (otherwise, file selections
		do not seem to be treated as the insertion location).
		         r        c    	    1    ��
�� 
pins  m    ��
�� 
alis  o      ���� 0 pwdalias pwdAlias      Z    #  ����  H         l    !�� ! I   �� "��
�� .coredoexbool        obj  " 4    �� #
�� 
cfol # o    ���� 0 pwdalias pwdAlias��  ��    r     $ % $ c     & ' & l    (�� ( n     ) * ) m    ��
�� 
ctnr * o    ���� 0 pwdalias pwdAlias��   ' m    ��
�� 
alis % o      ���� 0 pwdalias pwdAlias��  ��     + , + r   $ ) - . - n   $ ' / 0 / 1   % '��
�� 
psxp 0 o   $ %���� 0 pwdalias pwdAlias . o      ���� 0 pwd   ,  1 2 1 l  * *������  ��   2  3 4 3 l   * *�� 5��   54.
		Ask the user what to select. Dialog time out is equivalent to cancellation.
		The default "Select Matches" option clears the current Finder selection,
		whereas "Add Matches" leaves it intact. Clearing the selection is not done
		in Column view if the displayed folder is the only thing selected.
		    4  6 7 6 r   * O 8 9 8 I  * K�� : ;
�� .sysodlogaskr        TEXT : m   * + < <  Glob pattern:    ; �� = >
�� 
dtxt = m   , - ? ?       > �� @ A
�� 
btns @ J   . 3 B B  C D C m   . / E E  Cancel    D  F G F m   / 0 H H  Add Matches    G  I�� I m   0 1 J J  Select Matches   ��   A �� K L
�� 
dflt K m   6 7����  L �� M N
�� 
cbtn M m   : ;����  N �� O P
�� 
appr O o   > ?���� 0 pwd   P �� Q��
�� 
givu Q m   B E���� <��   9 o      ���� 0 dr   7  R S R Z   P � T U V�� T =  P [ W X W n   P W Y Z Y 1   S W��
�� 
bhit Z o   P S���� 0 dr   X m   W Z [ [       U L   ^ `����   V  \ ] \ =  c n ^ _ ^ n   c j ` a ` 1   f j��
�� 
bhit a o   c f���� 0 dr   _ m   j m b b  Select Matches    ]  c�� c Q   q � d e f d k   t � g g  h i h l  t t�� j��   j L F do not clear selection if the only thing selected is the focal folder    i  k�� k Z  t � l m���� l >  t } n o n c   t { p q p 1   t y��
�� 
sele q m   y z��
�� 
alis o o   { |���� 0 pwdalias pwdAlias m I  � ��� r��
�� .miscslctnull���    obj  r J   � �����  ��  ��  ��  ��   e R      ������
�� .ascrerr ****      � ****��  ��   f k   � � s s  t u t l  � ��� v��   v + % more than one thing already selected    u  w�� w I  � ��� x��
�� .miscslctnull���    obj  x J   � �����  ��  ��  ��  ��   S  y z y l  � �������  ��   z  { | { l   � ��� }��   }=7
		Initialize list of selected files. Generally identical to selection returned
		by Finder, except the present working directory should not be included,
		which is initially selected in some Column view circumstances (see above).
		This is a little clumsy; selection state is vaguely defined in Column view.
		    |  ~  ~ r   � � � � � 1   � ���
�� 
sele � o      ���� 0 selectables     � � � Q   � � � ��� � Z  � � � ����� � =  � � � � � c   � � � � � 1   � ���
�� 
sele � m   � ���
�� 
alis � o   � ����� 0 pwdalias pwdAlias � r   � � � � � J   � �����   � o      ���� 0 selectables  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��   �  � � � l  � �������  ��   �  � � � l   � ��� ���   �
		Get the glob pattern given by the user.
		We treat a blank pattern as cancellation (use * to select everything).
		Alternatively, omit this conditional to select the containing folder;
		this ought to be the default behavior once "../" issues are ironed out.
		    �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
ttxt � o   � ����� 0 dr   � o      ���� 	0 query   �  � � � Z  � � � ����� � =   � � � � � o   � ����� 	0 query   � m   � � � �       � L   � �����  ��  ��   �  � � � l  � �������  ��   �  � � � l   � ��� ���   � � �
		Ask ls for a listing of files that match the given pattern.
		From the ls man page:
			-d Directories are listed as plain files (not searched recursively).
		If nothing matches the query, ls will return an error; just stop.
		    �  � � � Q   � � � � � O  � � � � r   � � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � l  � � ��� � b   � � � � � b   � � � � � m   � � � �  /bin/ls -d     � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 pwd   � o   � ����� 	0 query  ��  ��   � o      ���� 0 matches   �  f   � � � R      ������
�� .ascrerr ****      � ****��  ��   � L  ����   �  � � � l ������  ��   �  � � � l  �� ���   ���
		Parse each line of the response from ls as the path to a match.
		The visibility test is twofold: the "info for" test throws an error on
		Icon^M (the full name doesn't survive all translations and transmissions).
		This try-info-for-visibilty test is the main bottleneck;
		for faster handling of many matches (100s), replace this
		repeat body with "set end of selectables to matchpath as POSIX file"
		    �  � � � X  k ��� � � k  )f � �  � � � r  )2 � � � c  ). � � � o  )*���� 0 	matchpath   � m  *-��
�� 
psxf � o      ���� 0 
posixmatch   �  ��� � Q  3f � ��� � k  6] � �  � � � r  6E � � � I 6A�� � �
�� .sysonfo4asfe        file � o  69���� 0 
posixmatch   � �� ���
�� 
ptsz � m  <=��
�� boovfals��   � o      ���� 0 fileinfo   �  ��� � Z F] � ����� � n  FN � � � 1  IM�
� 
pvis � o  FI�~�~ 0 fileinfo   � r  QY � � � o  QT�}�} 0 
posixmatch   � n       � � �  ;  WX � o  TW�|�| 0 selectables  ��  ��  ��   � R      �{�z�y
�{ .ascrerr ****      � ****�z  �y  ��  ��  �� 0 	matchpath   � n   � � � 2 �x
�x 
cpar � o  �w�w 0 matches   �  � � � l ll�v�u�v  �u   �  � � � l  ll�t ��t   �)#
		Conclude by selecting the results.
		The "try" protects against cases we don't [yet] handle,
		such as certain "../" path traversals and anything else that may come up.
		If the last item of selectables is a directory and we're using
		Column view, other items may not end up selected.
		    �  � � � Q  l� � � � � I oz�s ��r
�s .miscslctnull���    obj  � n  ov � � � 2  rv�q
�q 
cobj � o  or�p�p 0 selectables  �r   � R      �o � �
�o .ascrerr ****      � **** � o      �n�n 0 errmsg errMsg � �m ��l
�m 
errn � o      �k�k 0 errnum errNum�l   � k  �� � �  � � � I ���j � �
�j .sysodisAaleR        TEXT � b  �� � � � b  �� � � � m  �� � �   Could not make selection (    � o  ���i�i 0 errnum errNum � m  �� � �  ):    � �h � �
�h 
mesS � o  ���g�g 0 errmsg errMsg � �f ��e
�f 
as A � m  ���d
�d EAlTcriT�e   �  ��c � L  ���b�b  �c   �  ��a � l ���`�_�`  �_  �a    m      � ��null        ��  �
Finder.app �L2 x������������L2 x����တ  ��L2     ���        MACS   alis    b  Synapse                    ��9�H+    �
Finder.app                                                       B����        ����  	                CoreServices    ��r'      ��6n      �  �  �  .Synapse:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p    S y n a p s e  &System/Library/CoreServices/Finder.app  / ��     ��^ � l     �]�\�]  �\  �^       �[ � �Z�[   � �Y�X�W�V
�Y .aevtoappnull  �   � ****�X 0 pwdalias pwdAlias�W 0 pwd  �V    �U �T�S�R
�U .aevtoappnull  �   � ****�T  �S   �Q�P�O�Q 0 	matchpath  �P 0 errmsg errMsg�O 0 errnum errNum : ��N�M�L�K�J�I�H�G <�F ?�E E H J�D�C�B�A�@�?�>�=�< [ b�;�:�9�8�7�6�5 � ��4�3�2�1�0�/�.�-�,�+�*�)�(�' � ��&�%�$�#�"
�N 
pins
�M 
alis�L 0 pwdalias pwdAlias
�K 
cfol
�J .coredoexbool        obj 
�I 
ctnr
�H 
psxp�G 0 pwd  
�F 
dtxt
�E 
btns
�D 
dflt
�C 
cbtn
�B 
appr
�A 
givu�@ <�? 
�> .sysodlogaskr        TEXT�= 0 dr  
�< 
bhit
�; 
sele
�: .miscslctnull���    obj �9  �8  �7 0 selectables  
�6 
ttxt�5 	0 query  
�4 
strq
�3 .sysoexecTEXT���     TEXT�2 0 matches  
�1 
cpar
�0 
kocl
�/ 
cobj
�. .corecnte****       ****
�- 
psxf�, 0 
posixmatch  
�+ 
ptsz
�* .sysonfo4asfe        file�) 0 fileinfo  
�( 
pvis�' 0 errmsg errMsg �!� �
�! 
errn�  0 errnum errNum�  
�& 
mesS
�% 
as A
�$ EAlTcriT�# 
�" .sysodisAaleR        TEXT�R���*�,�&E�O*��/j  ��,�&E�Y hO��,E�O�������mva ma ka �a a a  E` O_ a ,a   hY ;_ a ,a   , *a ,�&� jvj Y hW X  jvj Y hO*a ,E` O *a ,�&�  jvE` Y hW X  hO_ a  ,E` !O_ !a "  hY hO ) a #�a $,%_ !%j %E` &UW 	X  hO [_ &a '-[a (a )l *kh  �a +&E` ,O ,_ ,a -fl .E` /O_ /a 0,E _ ,_ 6FY hW X  h[OY��O _ a )-j W #X 1 2a 3�%a 4%a 5�a 6a 7a 8 9OhOPU&alis    "  Synapse                    ��9�H+     Applications                                                      ��        ����  	                Synapse     ��r'      ��T`       Synapse:Applications    A p p l i c a t i o n s    S y n a p s e  Applications  / ��   �  / A p p l i c a t i o n s /�Z   ascr  ��ޭ